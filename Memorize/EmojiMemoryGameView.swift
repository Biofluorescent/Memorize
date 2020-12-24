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
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockwise: true).padding(5).opacity(0.4)
                Text(card.content)
                    //This is not setting the view's font, but modifying it
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
            
        }
    }
    
    // MARK: - Drawing Constants

    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.7
    }
}
