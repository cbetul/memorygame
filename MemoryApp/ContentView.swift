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

import SwiftUI

struct ContentView: View { // behaves as "view"
    var emojis = ["🍎", "🎂", "🍪","🧃", "💖", "🍭","a", "b", "c","d", "e", "f", "g", "h", "j","k", "l", "m", "n", "o", "p","r", "s", "t"]
    @State var emojiCount = 6
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self){
                        emoji in CardView(textContent: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.purple)
            Spacer()
            HStack {
                remove // button variable names
                Spacer() // space for alignment
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
            .padding(.horizontal)
            
    }
    var remove: some View { //remove button
        Button {
            if emojiCount > 1 { // error handling
                emojiCount -= 1
            }
                
        } label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        }
    }
    var add: some View { //add button
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.circle")
            }
        }
    }
}

// let = constant var = changeable variable
struct CardView: View {
    var textContent: String
    
    @State var faceuP: Bool = true // view still immutable,  acts like a pointer
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if faceuP {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(textContent).font(.largeTitle )
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            faceuP = !faceuP
        }
    }
}





// only for preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
          
    }
}
