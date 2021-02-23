//
//  MyTodoApp.swift
//  MyTodo
//
//  Created by Piotr Brus on 23/02/2021.
//

import SwiftUI

@main
struct MyTodoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
