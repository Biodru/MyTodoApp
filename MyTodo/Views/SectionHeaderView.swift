//
//  SectionHeaderView.swift
//  MyTodo
//
//  Created by Piotr Brus on 28/02/2021.
//

import SwiftUI

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

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(name: "Test")
    }
}
