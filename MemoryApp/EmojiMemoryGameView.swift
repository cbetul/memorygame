//
//  ContentView.swift
//  MemoryApp
//
//  Created by Betül Çimendağ on 17.02.2022.
//
// ---- MVVM -----
// Model -> UI Independent component (data, logic)
// ViewModel -> Binds View to Model (like a interpreter)
// View -> Reflects the model, Stateless & Reactive
// View

import SwiftUI

struct EmojiMemoryGameView: View { // behaves as "view"
    // If anything change in the model, it rebuilts the view
    @ObservedObject var game: EmojiMemoryGame
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]) {
                ForEach(game.cards){
                    card in CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.purple)
        .padding(.horizontal)
    }
}

// let = constant var = changeable variable
struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card){
        self.card = card
    }
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.faceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.textContent).font(.largeTitle )
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}


// only for preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
          
    }
}
