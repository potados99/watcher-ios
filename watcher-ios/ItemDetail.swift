//
//  ItemDetail.swift
//  watcher-ios
//
//  Created by Potados on 2021/01/22.
//

import SwiftUI

struct ItemDetail: View {
    var item: Task
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack() {
                    Text(item.description)
                }
                .navigationBarTitle(item.toDoItem)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }
        }
    }
}
