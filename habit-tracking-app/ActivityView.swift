//    init(activities: [Activity]) {

//  ActivityView.swift
//  habit-tracking-app
//
//  Created by saj panchal on 2021-07-17.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var object: Activities
    @State var index: Int
    @State var disableButton: Bool = false
 
    var body: some View {
       
        return Form {
            Text("Title: \(object.activities[index].title)")
            Text("Description: \(object.activities[index].description)")
            Text("Times Completed:\(object.activities[index].count)")
        
            Button("Complete Activity") {
                object.activities[index].count += 1
                self.disableButton = true
                Activities.storeData(activities: object.activities)
            }.disabled(disableButton)
            
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(object: Activities(), index: 0)
    }
}
