//
//  IconPickerView.swift
//  MyTodo
//
//  Created by Piotr Brus on 24/02/2021.
//

import SwiftUI

struct IconPickerView: View {
    //MARK: -Properties
    @Binding var selectedIcon: String
    
    //MARK: -Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(icons, id: \.self) { icon in
                    Circle().strokeBorder(selectedIcon == icon ? Color("colorMDarkPrimary") : Color("colorMLightPrimary"),lineWidth: 4)
                        .background(
                            Image(systemName: icon)
                                .foregroundColor(self.selectedIcon == icon ? Color("colorMDarkPrimary") : Color("colorMLightPrimary"))
                                .font(.title)
                                
                        )
                        .frame(width: 80, height: 80)
                        .onTapGesture {
                            self.selectedIcon = icon
                        }
                }
            })
        })
        .frame(height: 200)
        .padding(10)
    }
}

struct IconPickerView_Previews: PreviewProvider {
    static var previews: some View {
        IconPickerView(selectedIcon: .constant(icons[0]))
            .previewLayout(.sizeThatFits)
            .background(Color("backgroundMColor"))
    }
}
