//
//  ContentView.swift
//  Memorizer
//
//  Created by Josimar da Cunha Ferreira on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = [ "👻", "👺", "☠️", "🎃", "👾", "🤡", "👽", "🤖", "👁️", "🕸️" ]
    @State var cardCount : Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardsAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
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
    let content: String
    @ State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
           Group {
                card.fill(.white)
                card.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
           .opacity(isFaceUp ? 1 : 0)
            card.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
 
