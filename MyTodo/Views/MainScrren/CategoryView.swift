//
//  CategoryView.swift
//  MyTodo
//
//  Created by Piotr Brus on 25/02/2021.
//

import SwiftUI

struct CategoryView: View {
    //MARK: - Properties
    let name: String
    let icon: String
    let color: UIColor
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(Color(color))
            Spacer()
            Text(name)
                .font(.subheadline)
                .foregroundColor(Color(color))
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
        CategoryView(name: "Testowa", icon: "doc", color: .red)
            .previewLayout(.sizeThatFits)
    }
}
