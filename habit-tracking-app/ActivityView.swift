//
//  ActivityView.swift
//  habit-tracking-app
//
//  Created by saj panchal on 2021-07-17.
//

import SwiftUI

struct ActivityView: View {
    @State var activities: [Activity] = Activities.retrieveData()
    @State var index: Int
    @State var disableButton: Bool = false
 
    var body: some View {
       
        return Form {
            Text("Title: \(activities[index].title)")
            Text("Description: \(activities[index].description)")
            Text("Times Completed:\(activities[index].count)")
        
            Button("Complete Activity") {
                activities[index].count += 1
                print(activities[index].count)
                self.disableButton = true
                Activities.storeData(activities: activities)
            }.disabled(disableButton)
            
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activities: [], index: 0)
    }
}
