//
//  ContentView.swift
//  Memorizer
//
//  Created by Josimar da Cunha Ferreira on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @ State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                card.fill(.white)
                card.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
 
