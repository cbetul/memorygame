//
//  MemoryAppApp.swift
//  MemoryApp
//
//  Created by Betül Çimendağ on 17.02.2022.
//

import SwiftUI

@main
struct MemoryAppApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
