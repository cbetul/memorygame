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

struct ContentView: View { // behaves as "view"
    // If anything change in the model, it rebuilts the view
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]) {
                ForEach(viewModel.cards){
                    card in CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
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
    let card: MemoryGame<String>.Card
    
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
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
          
    }
}
