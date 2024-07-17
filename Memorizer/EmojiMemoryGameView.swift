//
//  ContentView.swift
//  Memorizer
//
//  Created by Josimar da Cunha Ferreira on 09/07/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    let emojis = [ "👻", "👺", "☠️", "🎃", "👾", "🤡", "👽", "🤖", "👁️", "🕸️" ]
    @State var cardCount : Int = 10
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardsAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
         }
        .imageScale(.large)
        .font(.title)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card){
        self.card = card
    }

    @ State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let cardFrame: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
           Group {
               cardFrame.fill(.white)
               cardFrame.strokeBorder(lineWidth: 2)
               Text(card.content)
                   .font(.system(size: 200))
                   .minimumScaleFactor(0.01)
                   .aspectRatio(contentMode: .fit)
            }
           .opacity(card.isFaceUp ? 1 : 0)
            cardFrame.fill()
                .opacity(card.isFaceUp ? 0 : 1)
            
        }
    }
}

struct EmojiMemoryGameView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: <#T##EmojiMemoryGame#>)
    }
    
}
 
