//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tanner Quesenberry on 12/18/20.
//
// View Model

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame(numberOfPairsOfCards: emojis.count, cardContentFactory: { pairIndex in
            return emojis[pairIndex]
        })
    }
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
