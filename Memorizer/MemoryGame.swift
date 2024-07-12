//
//  MemorizeGame.swift
//  Memorizer
//
//  Created by Josimar da Cunha Ferreira on 11/07/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
