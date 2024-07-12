//
//  EmojiMemoryGame.swift
//  Memorizer
//
//  Created by Josimar da Cunha Ferreira on 11/07/24.
//

import SwiftUI

class EmojiMemoryGame {
    var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
