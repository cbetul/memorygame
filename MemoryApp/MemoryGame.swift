//
//  MemoryGame.swift
//  MemoryApp
//
//  Created by Betül Çimendağ on 17.02.2022.
//
// Model

import Foundation

// Equatable -> dont care type is equatable
struct MemoryGame<CardContent> where CardContent: Equatable { // card content "more flexible"
    
    private(set) var cards: Array<Card> //private(set), others only reach the variables, cannot change it
    private var indexOneFaceupCard: Int?
    
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
        // if the card id is in index
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}), !cards[chosenIndex].faceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOneFaceupCard{
                if cards[chosenIndex].textContent == cards[potentialMatchIndex].textContent{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOneFaceupCard = nil
            } else {
                for index in cards.indices { // turns face up all cards
                    cards[index].faceUp = false
                }
                indexOneFaceupCard = chosenIndex
            }
            cards[chosenIndex].faceUp.toggle()
        }
    }
    
    
    //Identifiable -> simple attribute that makes every struct unique
    struct Card: Identifiable {  //card structure (variables, attributes) -> MemoryGame.Card
        var textContent: CardContent //don't care variable
        var faceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
    }
}
