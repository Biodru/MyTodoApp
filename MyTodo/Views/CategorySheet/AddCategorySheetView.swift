//
//  AddCategorySheetView.swift
//  MyTodo
//
//  Created by Piotr Brus on 24/02/2021.
//

import SwiftUI

struct AddCategorySheetView: View {
    //MARK: -Properties
    @State var categoryName: String
    @State var selectedIcon: String
    @State var selectedColor: Color
    @State var valid: Bool = true
    
    //MARK: -Functions
    func checkValid() {
        if categoryName != "" {
            self.valid = true
        } else {
            self.valid = false
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
                //MARK: -Category Title
                HStack {
                    Text("Nazwa kategorii")
                        .font(.subheadline)
                        .foregroundColor(Color("accentMColor"))
                        .fontWeight(.light)
                    Spacer()
                }
                TextFieldView(categoryName: $categoryName, valid: $valid)
                Spacer()
                //MARK: -Category Icon
                HStack {
                    Text("Ikona")
                        .font(.subheadline)
                        .foregroundColor(Color("accentMColor"))
                        .fontWeight(.light)
                    Spacer()
                }
                IconPickerView(selectedIcon: $selectedIcon)
                Spacer()
                //MARK: -Category Color
                HStack {
                    Text("Kolor")
                        .font(.subheadline)
                        .foregroundColor(Color("accentMColor"))
                        .fontWeight(.light)
                    Spacer()
                }
                ColorPickerView(selectedColor: $selectedColor)
                //MARK: -Button
//                Button(action: {
//                    checkValid()
//                    print(selectedIcon)
//                    print(selectedColor)
//                    print(categoryName)
//                }, label: {
//                    Text("Dodaj kategorię")
//                })
            }//:VStack
            .padding(10)
        })
        .padding(10)
        //.edgesIgnoringSafeArea(.all)
        .background(Color("backgroundMColor"))
    }
}


//MARK: -Preview
struct AddCategorySheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategorySheetView(categoryName: "", selectedIcon: icons[0], selectedColor: colors[0], valid: true)
    }
}