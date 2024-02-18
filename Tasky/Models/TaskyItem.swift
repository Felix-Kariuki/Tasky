//
//  TaskyItem.swift
//  Tasky
//
//  Created by Felix kariuki on 18/02/2024.
//

import Foundation
import SwiftData

@Model
class TaskyItem {
    var title: String
    var isDone:Bool
    var taskyDesc:String
    var timeStamp: Date
    init(title: String = "", isDone: Bool = false, taskyDesc: String = "", timeStamp:Date = .now) {
        self.title = title
        self.isDone = isDone
        self.taskyDesc = taskyDesc
        self.timeStamp = timeStamp
    }
}
