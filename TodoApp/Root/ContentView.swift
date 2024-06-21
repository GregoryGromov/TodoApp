//
//  ContentView.swift
//  TodoApp
//
//  Created by Григорий Громов on 21.06.2024.
//

import SwiftUI

struct ContentView: View {
    
//    let manager = FileCache(todoItems: [TodoItem(
//        id: "4ocnho43yrpq",
//        text: "write to Misha",
//        importance: .unimportant,
//        deadline: Date(timeIntervalSince1970: 1234),
//        isDone: false,
//        dateCreation: Date(timeIntervalSince1970: 1233),
//        dateChanging: Date(timeIntervalSince1970: 1232)
//    ),
//    TodoItem(
//        id: "fu39ubjhaq12",
//        text: "finish the program",
//        importance: .important,
//        deadline: Date(timeIntervalSince1970: 1231),
//        isDone: true,
//        dateCreation: Date(timeIntervalSince1970: 1230),
//        dateChanging: Date(timeIntervalSince1970: 1229)
//    ) ])
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
//        .onTapGesture {
//            try! manager.saveTodoItemsToFile()
//            try! manager.getTodoItemsFromFile()
//        }
    }
}

#Preview {
    ContentView()
}
