//
//  Category_Sheet_Todo.swift
//  MyTodo
//
//  Created by Piotr Brus on 28/02/2021.
//

import SwiftUI

struct Category_Sheet_Todo: View {
    //MARK: - Properties
    var category: Category_entity?
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text(category?.cat_name ?? "Brak")
                    .font(.title)
                    .foregroundColor(Color("colorMDarkPrimary"))
                Spacer()
                //MARK: - Do zrobione
                SectionHeaderView(name: "Do Zrobienia")
                VStack(spacing: 10) {
                    ForEach(todos, id: \.self) { todo in
                        if todo.category! == category?.cat_name! && !todo.done {
                            TodoView(done: todo.done, todo: todo, colorPassed: category?.color ?? .red)
                                    .environment(\.managedObjectContext, self.managedObjectContext)
                            }
                            
                    }
                }//:VStack
                .padding(10)
                //MARK: - Zrobione  
                SectionHeaderView(name: "Zrobione")
                VStack(spacing: 10) {
                    ForEach(todos, id: \.self) { todo in
                        if todo.category! == category?.cat_name! && todo.done {
                            TodoView(done: todo.done, todo: todo, colorPassed: category?.color ?? .red)
                                    .environment(\.managedObjectContext, self.managedObjectContext)
                            }
                            
                    }
                }//:VStack
                .padding(10)
            }//:VStack
        }//:Scroll
        .padding(10)
        .background(Color(category?.color ?? .gray))
        .edgesIgnoringSafeArea(.bottom)
    }
}

//MARK: - Preview
struct Category_Sheet_Todo_Previews: PreviewProvider {
    static var previews: some View {
        Category_Sheet_Todo(category: Category_entity())
    }
}
