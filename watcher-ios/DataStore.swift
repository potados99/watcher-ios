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
    let description: String
}

class TaskStore: ObservableObject {
    @Published var tasks = [
        Task(id: "1", toDoItem: "함뮤 빵댕이는", description: "찰진 빵댕이>_<"),
        Task(id: "2", toDoItem: "구구 빵댕이는", description: "축 처진 빵댕이-_-")
    ]
}
