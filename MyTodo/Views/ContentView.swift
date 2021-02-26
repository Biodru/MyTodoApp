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
    @State var isPresesnted: Bool = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Category_entity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Category_entity.cat_name, ascending: true)]) var categories: FetchedResults<Category_entity>
    
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
                            self.isPresesnted.toggle()
                        }, label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color("colorMDarkPrimary"))
                        })) {
                            ForEach(self.categories, id: \.self) { (category: Category_entity) in
                                CategoryView(name: category.cat_name ?? "Brak", icon: category.icon ?? "", color: category.color ?? .red)
                                    .onAppear(perform: {
                                        print(category.color)
                                    })
                                    
                            }//:Loop
                        }//:Section
                    })//:LazyHGrid
                    .frame(height: 100)
                    .padding(10)
                })//:Scroll
                Spacer()
                //MARK: - Today
          }//:VStack
            .padding(10)
            .sheet(isPresented: $isPresesnted) {
                AddCategorySheetView(categoryName: "", selectedIcon: icons[0], selectedColor: colors[0], valid: true)
                    .environment(\.managedObjectContext, self.managedObjectContext)
        }
        }//:ScrollVertical
    }
  
    //MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
