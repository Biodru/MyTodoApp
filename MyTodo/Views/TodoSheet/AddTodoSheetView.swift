//
//  AddTodoSheetView.swift
//  MyTodo
//
//  Created by Piotr Brus on 26/02/2021.
//

import SwiftUI

struct AddTodoSheetView: View {
    //MARK: - Properties
    @State var showCalendar: Bool = false
    @State var showCategoryPicker: Bool = false
    @State var isCatAnimated: Bool = false
    @State var isAnimated: Bool = false
    @State var selectedDate: Date = Date()
    @State var valid: Bool
    @State var todoName: String
    @State var done: Bool
    @State var categoryNames: [String]
    @State var selectedCategory: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Category_entity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Category_entity.cat_name, ascending: true)]) var categories: FetchedResults<Category_entity>
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 15) {
                //MARK: -Header
                Text("Dodaj nowe zadanie")
                    .font(.title)
                    .foregroundColor(Color("colorMDarkPrimary"))
                    .fontWeight(.heavy)
                Spacer()
                Group {
                    //MARK: -Category Title
                    SectionHeaderView(name: "Nazwa Zadania")
                    TextFieldView(categoryName: $todoName, valid: $valid, hintText: "Nazwa zadania")
                    Spacer()
                    SectionHeaderView(name: "Data?")
                    if self.showCalendar {
                        DatePicker("Termin", selection: $selectedDate)
                            .foregroundColor(Color("colorMDarkPrimary"))
                            .font(.largeTitle)
                            .opacity(isAnimated ? 1 : 0)
                            .onAppear(perform: {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    self.isAnimated.toggle()
                                }
                            })
                            .onDisappear(perform: {
                                withAnimation(.easeOut(duration: 0.5)) {
                                    self.isAnimated.toggle()
                                }
                            })
                        Spacer()
                    }
                    Button(action: {
                        self.showCalendar.toggle()
                    }, label: {
                        Text(self.showCalendar ? "Usuń datę" : "Dodaj datę")
                    })
                    SectionHeaderView(name: "Kategoria?")
                    if self.showCategoryPicker {
                        Picker("Wybierz kategorię", selection: $selectedCategory) {
                            ForEach(categoryNames, id: \.self) {category in
                                Text(category ?? "Brak")
                            }
                        }//:Picker
                        .foregroundColor(Color("colorMDarkPrimary"))
                        .font(.largeTitle)
                        .opacity(isCatAnimated ? 1 : 0)
                        .onAppear(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                self.isCatAnimated.toggle()
                            }
                        })
                        .onDisappear(perform: {
                            withAnimation(.easeOut(duration: 0.5)) {
                                self.isCatAnimated.toggle()
                            }
                        })
                    Spacer()
                    }
                    Button(action: {
                        self.showCategoryPicker.toggle()
                    }, label: {
                        Text(self.showCategoryPicker ? "Usuń kategorie" : "Dodaj kategorie")
                    })//:CatButton
                    Spacer()
                }//:Group
                //MARK: -Button
                Button(action: {
                    if todoName != "" {
                        let newTodo = Todo(context: self.managedObjectContext)
                        if showCalendar {
                            newTodo.date = self.selectedDate
                        }
                        if showCategoryPicker {
                            newTodo.category = self.selectedCategory ?? ""
                        }
                        newTodo.name = self.todoName
                        newTodo.done = false
                        
                        
                        
//                        cat.cat_name = self.categoryName
//                        cat.icon = self.selectedIcon
//                        cat.color = UIColor(self.selectedColor)
                        self.presentationMode.wrappedValue.dismiss()
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }

                    }
                                        
                }, label: {
                    Text("Dodaj zadanie")
                })
            }//:VStack
            .padding(10)
        })
        .onAppear(perform: {
            for category in categories {
                categoryNames.append(category.cat_name ?? "Brak")
            }
        })
        .padding(10)
        //.edgesIgnoringSafeArea(.all)
        .background(Color("backgroundMColor"))
    }
}

//MARK: - Preview
struct AddTodoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoSheetView(valid: true, todoName: "Zrobić", done: false, categoryNames: [])
    }
}

struct SectionHeaderView: View {
    var name: String
    var body: some View {
        HStack {
            Text(name)
                .font(.subheadline)
                .foregroundColor(Color("accentMColor"))
                .fontWeight(.light)
            Spacer()
        }
    }
}
