//
//  EmojiMemoryGame.swift
//  MemoryApp
//
//  Created by BetΓΌl ΓimendaΔ on 17.02.2022.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    // static var is similar to global var. but it belongs to its own class (EmojiMemoryGame.emojis)
    //instead of using global variables static is more secure and useful
    private static let emojis = ["π", "π", "πͺ","π§", "π", "π­","π", "π", "π§","π", "π", "π", "π ", "π₯", "π§","π", "π₯", "π§©", "π²", "π", "π","πͺ", "β°οΈ", "πͺ"]
    
    private static func createMemoryGame() -> MemoryGame<String> { //CardContent is string here
        MemoryGame<String>(numOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)

    func choose(_ card:Card){
        //objectWillChange.send() // anytime change in the model, it will announced
        model.choose(card)
    }
    
}
