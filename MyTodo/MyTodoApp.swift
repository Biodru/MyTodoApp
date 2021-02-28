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
            //AddTodoSheetView(valid: true, todoName: "Zrobić", done: false, category: "Dodaj zadanie")
            //AddCategorySheetView(categoryName: "", selectedIcon: icons[0], selectedColor: colors[0], valid: true)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
