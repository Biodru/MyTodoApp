//
//  AddCatSectionHeader.swift
//  MyTodo
//
//  Created by Piotr Brus on 28/02/2021.
//

import SwiftUI

struct AddCatSectionHeader: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color("accentMColor"))
                .fontWeight(.light)
            Spacer()
        }
        .padding(.leading, 10)
    }
}

struct AddCatSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        AddCatSectionHeader(title: "Test")
    }
}
