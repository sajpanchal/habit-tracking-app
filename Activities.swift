//
//  Activities.swift
//  habit-tracking-app
//
//  Created by saj panchal on 2021-07-17.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [Activity] = {
        if let data = UserDefaults.standard.data(forKey: "activities") {
            do {
                let decoder = JSONDecoder()
                let activities = try decoder.decode([Activity].self, from: data)
                return activities
            }
            catch {
                return []
            }
            
        }
        else {
            return []
        }
    }()

 static func storeData(activities: [Activity]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(activities)
            UserDefaults.standard.setValue(data, forKey: "activities")
        }
        catch{
            
        }
    }
   static func retrieveData() -> [Activity] {
        if let data = UserDefaults.standard.data(forKey: "activities") {
            do {
                let decoder = JSONDecoder()
                let activities = try decoder.decode([Activity].self, from: data)
                return activities
            }
            catch {
                return []
            }
            
        }
        else {
            return []
        }
    }
}
