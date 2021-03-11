//
//  TodoView.swift
//  MyTodo
//
//  Created by Piotr Brus on 27/02/2021.
//

import SwiftUI

struct TodoView: View {
    //MARK: - Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var done: Bool
    var todo: Todo
    var colorPassed: UIColor
    var body: some View {
        HStack(spacing: 10) {
            Button(action: {
                self.done.toggle()
                self.todo.done = self.done
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
            }, label: {
                Circle()
                    .frame(width: 30, height: 30)
                    .overlay(Circle().stroke(Color(colorPassed), lineWidth: 2)
                                .background(self.todo.done ? Circle().foregroundColor(Color(colorPassed)) : Circle().foregroundColor(Color("colorMDarkPrimary"))))
            })
            .padding(10)
            Text(self.todo.name ?? "Brak")
                .font(.subheadline)
                .foregroundColor(Color(colorPassed))
                .strikethrough(self.todo.done, color: Color(colorPassed))
            Spacer()
        }
        .frame(height: 60)
        .background(Color("colorMDarkPrimary")).cornerRadius(12)
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(done: false, todo: Todo(), colorPassed: .red)
            .previewLayout(.sizeThatFits)
    }
}
