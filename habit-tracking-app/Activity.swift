//
//  Activity.swift
//  habit-tracking-app
//
//  Created by saj panchal on 2021-07-17.
//

import Foundation
class Activity: Codable {
    
    var title: String
    var description: String
    var count: Int
    init(title: String, description: String, count: Int) {
        self.title = title
        self.description = description
        self.count = count
    }
}
