//
//  SheetViewEnum.swift
//  MyTodo
//
//  Created by Piotr Brus on 26/02/2021.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case category, todo, categoryTodosList
    
    var id: Int {
        hashValue
    }
}
