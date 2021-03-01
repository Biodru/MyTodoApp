//
//  AddCategorySheetView.swift
//  MyTodo
//
//  Created by Piotr Brus on 24/02/2021.
//

import SwiftUI

struct AddCategorySheetView: View {
    //MARK: -Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    @State var categoryName: String
    @State var selectedIcon: String
    @State var selectedColor: Color
    @State var valid: Bool = true
    
    //MARK: -Functions
    func checkValid() -> Bool{
        if categoryName != "" {
            self.valid = true
            return true
        } else {
            self.valid = false
            return false
        }
    }
    //MARK: -Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 15) {
                //MARK: -Header
                Text("Dodaj nową kategorię")
                    .font(.title)
                    .foregroundColor(Color("colorMDarkPrimary"))
                    .fontWeight(.heavy)
                Spacer()
                Group {
                    //MARK: -Category Title
                    AddCatSectionHeader(title: "Nazwa kategorii")
                    TextFieldView(categoryName: $categoryName, valid: $valid,hintText: "Podaj nazwę kategorii")
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Spacer()
                    //MARK: -Category Icon
                    AddCatSectionHeader(title: "Ikona")
                    IconPickerView(selectedIcon: $selectedIcon)
                    Spacer()
                    //MARK: -Category Color
                    AddCatSectionHeader(title: "Kolor")
                    ColorPickerView(selectedColor: $selectedColor)
                    Spacer()
                }
                //MARK: -Button
                Button(action: {
                    if checkValid() {
                        let cat = Category_entity(context: self.managedObjectContext)
                        cat.cat_name = self.categoryName
                        cat.icon = self.selectedIcon
                        cat.color = UIColor(self.selectedColor)
                        self.presentationMode.wrappedValue.dismiss()
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }

                    }
                                        
                }, label: {
                    Text("Dodaj kategorię")
                })
            }//:VStack
            .padding(.top, 10)
            .padding(.bottom, 10)
            .padding(.leading, 0)
            .padding(.trailing, 0)
        })
        //.padding(10)
        .background(Color("backgroundMColor"))
        .edgesIgnoringSafeArea(.bottom)
    }
}


//MARK: -Preview
struct AddCategorySheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategorySheetView(categoryName: "", selectedIcon: icons[0], selectedColor: colors[0], valid: true)
    }
}
