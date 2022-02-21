//
//  MemoryGame.swift
//  MemoryApp
//
//  Created by Betül Çimendağ on 17.02.2022.
//
// Model

import Foundation

struct MemoryGame<CardContent>{ // card content "more flexible"
    
    private(set) var cards: Array<Card> //private(set), others only reach the variables, cannot change it
    
    // init function
    init(numOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) { //adds  x2 cards to the array
        cards = Array<Card>()
        for pairIndex in 0..<numOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(textContent: content, id: pairIndex*2))
            cards.append(Card(textContent: content, id: pairIndex*2+1))
        }
    
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].faceUp.toggle()
        print("\(cards)")
    }
    
    func index (of card: Card) -> Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 
    }
    
    //Identifiable -> simple attribute that makes every struct unique
    struct Card: Identifiable {  //card structure (variables, attributes) -> MemoryGame.Card
        var textContent: CardContent //don't care variable
        var faceUp: Bool = true
        var isMatched: Bool = false
        var id: Int
    }
}
