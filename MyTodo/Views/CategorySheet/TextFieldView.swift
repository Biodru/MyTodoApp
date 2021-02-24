//
//  TextFieldView.swift
//  MyTodo
//
//  Created by Piotr Brus on 24/02/2021.
//

import SwiftUI

struct TextFieldView: View {
    //MARK: -Properties
    @Binding var categoryName: String
    @Binding var valid: Bool
    
    //MARK: -Body
    var body: some View {
        TextField("Podaj nazwę kategorii", text: $categoryName)
            .padding(10)
            .font(.largeTitle)
            .foregroundColor(Color("colorMDarkPrimary"))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(valid ? Color("colorMLightPrimary") : Color.red, lineWidth: 4))
            
    }
}


//MARK: -Preview
struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(categoryName: .constant(""), valid: .constant(true))
            .previewLayout(.sizeThatFits)
            .background(Color("backgroundMColor"))
    }
}
