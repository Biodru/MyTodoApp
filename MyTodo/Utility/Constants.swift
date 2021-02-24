//
//  Constants.swift
//  MyTodo
//
//  Created by Piotr Brus on 24/02/2021.
//

import SwiftUI


let colors: [Color] = [Color.white, Color.black, Color.red, Color.green, Color.blue, Color.gray, Color.pink, Color.purple, Color.yellow]
let icons: [String] = ["folder","pencil","doc.text","book","person", "globe", "music.note", "play.rectangle","mic","location", "camera", "video","cart", "paintbrush","house", "car", "gamecontroller","gift", "checkmark"]

let rowSpacing: CGFloat = 10
let columnSpacing: CGFloat = 10

var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
