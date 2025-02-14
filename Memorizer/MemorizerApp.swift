//
//  MemorizerApp.swift
//  Memorizer
//
//  Created by Josimar da Cunha Ferreira on 09/07/24.
//

import SwiftUI

@main
struct MemorizerApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
