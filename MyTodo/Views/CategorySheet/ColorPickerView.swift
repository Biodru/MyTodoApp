//
//  ColorPickerView.swift
//  MyTodo
//
//  Created by Piotr Brus on 24/02/2021.
//

import SwiftUI

struct ColorPickerView: View {
    //MARK: -Properties
    @Binding var selectedColor: Color
    
    //MARK: -Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(colors, id: \.self) { color in
                    Circle().strokeBorder(selectedColor == color ? Color("colorMDarkPrimary") : Color("colorMLightPrimary"),lineWidth: 4)
                        .background(Circle().foregroundColor(color))
                        .frame(width: 80, height: 80)
                        .onTapGesture {
                            self.selectedColor = color
                        }
                }
            })
        })
        .frame(height: 200)
        .padding(10)
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: .constant(Color.white))
            .background(Color("backgroundMColor"))
            .previewLayout(.sizeThatFits)
    }
}
