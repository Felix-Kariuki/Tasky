//
//  TaskyApp.swift
//  Tasky
//
//  Created by Felix kariuki on 18/02/2024.
//

import SwiftUI
import SwiftData

@main
struct TaskyApp: App {
    var body: some Scene {
        WindowGroup {
            TasksListView()
                .modelContainer(for: TaskyItem.self)
        }
    }
}
