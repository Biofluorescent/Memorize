//
//  ContentView.swift
//  Memorize
//
//  Created by Tanner Quesenberry on 12/17/20.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    viewModel.choose(card: card)
                })
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}
