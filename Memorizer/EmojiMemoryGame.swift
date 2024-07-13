//
//  EmojiMemoryGame.swift
//  Memorizer
//
//  Created by Josimar da Cunha Ferreira on 11/07/24.
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = [ "👻", "👺", "☠️", "🎃", "👾", "🤡", "👽", "🤖", "👁️", "🕸️" ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
    
    private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
