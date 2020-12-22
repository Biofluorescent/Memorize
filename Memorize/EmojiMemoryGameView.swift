//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Tanner Quesenberry on 12/17/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    //Body is called by the system
    var body: some View {
        //Cannot put vars inside view builders like HStack/VStack/ZStack
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    viewModel.choose(card: card)
                })
                .padding(5)
        }
            .padding()
            .foregroundColor(Color.orange)


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        //This is not setting the view's font, but modifying it
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.75
    }
}
