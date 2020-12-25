//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tanner Quesenberry on 12/18/20.
//
// View Model

import SwiftUI

//Only be ObservableObject if a class
class EmojiMemoryGame: ObservableObject {
    //Property wrapper Published. Every time model changes, objectWillChange.send is called
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    private static func createMemoryGame() -> MemoryGame<String> {
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
        objectWillChange.send()
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
