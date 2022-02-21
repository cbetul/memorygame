//
//  MemoryAppApp.swift
//  MemoryApp
//
//  Created by Betül Çimendağ on 17.02.2022.
//

import SwiftUI

@main
struct MemoryAppApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
