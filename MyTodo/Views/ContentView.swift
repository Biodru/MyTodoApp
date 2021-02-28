//
//  ContentView.swift
//  MyTodo
//
//  Created by Piotr Brus on 23/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - Properites
    @State var activeSheet: ActiveSheet?
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Category_entity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Category_entity.cat_name, ascending: true)]) var categories: FetchedResults<Category_entity>
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    //MARK: - Functions
    func todo_category_color(cat_name: String) -> UIColor {
        for index in 0..<categories.count {
            if(categories[index].cat_name == cat_name) {
                return categories[index].color ?? .black
            }
        }
        return .black
    }
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                //MARK: -Hello
                Text("Dzień dobry Piotrze!")
                    .font(.title)
                    .foregroundColor(Color("colorMDarkPrimary"))
                //MARK: - Categories
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHGrid(rows: gridLayoutCategory, alignment: .center, spacing: columnSpacing, content: {
                        Section(footer: Button(action: {
                            activeSheet = .category
                        }, label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color("colorMDarkPrimary"))
                        })) {
                            ForEach(self.categories, id: \.self) { (category: Category_entity) in
                                CategoryView(name: category.cat_name ?? "Brak", icon: category.icon ?? "", color: category.color ?? .red)
                                    .onAppear(perform: {
                                        //print(category.color)
                                    })
                                    
                            }//:Loop
                        }//:Section
                    })//:LazyHGrid
                    .frame(height: 100)
                    .padding(10)
                })//:Scroll
                Spacer()
                //MARK: - Today
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 10) {
                        ForEach(todos, id: \.self) { todo in
                            TodoView(done: todo.done, colorPassed: todo_category_color(cat_name: todo.category ?? ""), name: todo.name ?? "", date: Date())
                                .onAppear(perform: {
                                    print(todo.category)
                                    print(categories[0].cat_name)
                                })
                        }
                    }
                    .padding(10)
                })
          }//:VStack
            .padding(10)
            .sheet(item: $activeSheet, onDismiss: {
                self.activeSheet = nil
            }) { item in
                switch item {
                case .todo:
                    AddTodoSheetView(valid: true, todoName: "Zrobić", done: false, categoryNames: [])
                        .environment(\.managedObjectContext, self.managedObjectContext)
                case .category:
                    AddCategorySheetView(categoryName: "", selectedIcon: icons[0], selectedColor: colors[0], valid: true)
                        .environment(\.managedObjectContext, self.managedObjectContext)
                }
                
        }//:AddCategory
            
        }//:ScrollVertical
        .overlay(ZStack {
            Button(action: {
                activeSheet = .todo
                    }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("colorMDarkPrimary"))
                    .background(Circle().fill(Color("colorMLightPrimary")))
                    .frame(width: 50, height: 50, alignment: .center)
            })
        }//:ZStack
        .padding(.bottom, 10)
        .padding(.trailing, 10)
        , alignment: .bottomTrailing
        )//:OverLayButton
    }
  
    //MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
