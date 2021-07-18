//
//  ContentView.swift
//  habit-tracking-app
//
//  Created by saj panchal on 2021-07-17.
//

import SwiftUI

struct ContentView: View {
    
   
    @State var activities: [Activity] = Activities.retrieveData()
    @State var title: String = ""
    @State var description: String = ""
    @State var count: Int = 0
    @State var addActivityForm: Bool = false
    var activityList: [String] {
        var str: [String] = []
        for activity in activities {
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
                        ForEach(0..<activityList.count, id:\.self) { activity in
                            
                           //navigation link works only within Navigation View
                            NavigationLink(
                                destination: ActivityView(activities: activities, index: activity)
                                , label: {
                                    Text(activityList[activity])
                                   
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
                            activities.append(activity)
                            Activities.storeData(activities: activities)
                         
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
