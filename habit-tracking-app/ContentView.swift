//
//  ContentView.swift
//  habit-tracking-app
//
//  Created by saj panchal on 2021-07-17.
//

import SwiftUI

struct ContentView: View {
    
  @ObservedObject var object = Activities()
  
    @State var title: String = ""
    @State var description: String = ""
    @State var count: Int = 0
    @State var addActivityForm: Bool = false
   var activityList: [String] {
        var str: [String] = []
    for activity in object.activities {
            str.append(activity.title)
        }
        return str
    }
    var body: some View {
        NavigationView {
            VStack {
                Text("List of Activities:")
             
                Form {
                    List {
                        ForEach(0..<object.activities.count, id:\.self) { activity in
                            
                           //navigation link works only within Navigation View
                            NavigationLink(
                                destination: ActivityView(object: object, index: activity)
                                , label: {
                                    Text(object.activities[activity].title)
                                })
                        }
                    }
                }.navigationBarTitle(Text(""), displayMode: .inline)
            
                Button("Add Activity") {
                    self.addActivityForm.toggle()
                }.sheet(isPresented: $addActivityForm, content: {
                    Form {
                        TextField("Add Activity title", text: $title)
                        TextField("Add Activity Description", text:$description)
                        Button(action: {
                            
                            let activity = Activity(title: title, description: description, count: 0)
                            object.activities.append(activity)
                            Activities.storeData(activities: object.activities)
                         
                            self.addActivityForm.toggle()
                            
                        }, label: {
                            Text("Add Activity")
                        })
                    }
                
                })
               
               
            
        }
        }
    }
        
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
