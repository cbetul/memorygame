//
//  EmojiMemoryGame.swift
//  MemoryApp
//
//  Created by Betül Çimendağ on 17.02.2022.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // static var is similar to global var. but it belongs to its own class (EmojiMemoryGame.emojis)
    //instead of using global variables static is more secure and useful
    static let emojis = ["🍎", "🎂", "🍪","🧃", "💖", "🍭","🍉", "🍒", "🧀","🍔", "🍕", "💀", "🐠", "🥀", "🌧","🌟", "🔥", "🧩", "🎲", "🎈", "🎀","🔪", "⚰️", "🪓"]
    
    static func createMemoryGame() -> MemoryGame<String> { //CardContent is string here
        MemoryGame<String>(numOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card){
        objectWillChange.send() // anytime change in the model, it will announced
        model.choose(card)
    }
    
}
