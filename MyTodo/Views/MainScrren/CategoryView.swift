//
//  CategoryView.swift
//  MyTodo
//
//  Created by Piotr Brus on 25/02/2021.
//

import SwiftUI

struct CategoryView: View {
    //MARK: - Properties
    //TODO: - Przerobić na Category_entity
    let category: Category_entity
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: self.category.icon ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(Color(self.category.color ?? .red))
            Spacer()
            Text(self.category.cat_name ?? "Brak")
                .font(.subheadline)
                .foregroundColor(Color(self.category.color ?? .red))
        }//:HStack
        .frame(width: 140, height: 60)
        .padding(5)
        .background(Color("colorMLightPrimary").cornerRadius(12))
        .background(RoundedRectangle(cornerRadius: 12).stroke(Color("colorMDarkPrimary"), lineWidth: 1))
        
        
    }
}

//MARK: - Preview
struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category_entity())
            .previewLayout(.sizeThatFits)
    }
}
