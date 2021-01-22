//
//  DataStore.swift
//  watcher-ios
//
//  Created by Potados on 2021/01/22.
//

import Foundation

struct Task: Identifiable {
    let id: String
    let toDoItem: String
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task(id: "1", toDoItem: "do some")]
}
