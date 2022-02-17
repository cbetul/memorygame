//
//  EmojiMemoryGame.swift
//  MemoryApp
//
//  Created by Betül Çimendağ on 17.02.2022.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame {
    // static var is similar to globala var. but it belongs to its own class (EmojiMemoryGame.emojis)
    static let emojis = ["🍎", "🎂", "🍪","🧃", "💖", "🍭","🍉", "🍒", "🧀","🍔", "🍕", "💀", "🐠", "🥀", "🌧","🌟", "🔥", "🧩", "🎲", "🎈", "🎀","🔪", "⚰️", "🪓"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}
