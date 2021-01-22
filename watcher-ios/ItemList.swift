//
//  ContentView.swift
//  watcher-ios
//
//  Created by Potados on 2021/01/22.
//

import SwiftUI

struct ItemList: View {
    
    @ObservedObject var taskStore = TaskStore()
    @State var newTodo: String = "";
    @State var newDescription: String = "";
    
    var newItemBar: some View {
        HStack {
            VStack {
                TextField("너의 빵댕이는", text: self.$newTodo)
                TextField("어떤 빵댕이니?", text: self.$newDescription)
            }
            Button(action: self.addNewToDo, label: {
                Text("추가하기")
            })
        }
    }
    
    func addNewToDo() {
        taskStore.tasks.append(
            Task(id: String(taskStore.tasks.count + 1), toDoItem: newTodo, description: newDescription)
        )
        
        self.newTodo = ""
        self.newDescription = ""
        
        // Hide keyboard
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.taskStore.tasks) { task in
                        NavigationLink(destination: ItemDetail(item: task)) {
                            Text(task.toDoItem)
                        }
                    }.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                    .buttonStyle(PlainButtonStyle())

                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("자기소개")
                .navigationBarItems(trailing: EditButton())
                
                newItemBar.padding()
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}
