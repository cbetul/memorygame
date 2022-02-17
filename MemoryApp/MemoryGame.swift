//
//  MemoryGame.swift
//  MemoryApp
//
//  Created by Betül Çimendağ on 17.02.2022.
//
// Model

import Foundation

struct MemoryGame<CardContent>{
    
    private(set) var cards: Array<Card> //private(set), others only reach the variables, cannot change it
    
    init(numOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) { //adds  x2 cards to the array
        cards = Array<Card>()
        for pairIndex in 0..<numOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(textContent: content))
            cards.append(Card(textContent: content))
        }
    
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var textContent: CardContent //don't care variable
        var faceUp: Bool = false
        var isMatched: Bool = false
    }
}
