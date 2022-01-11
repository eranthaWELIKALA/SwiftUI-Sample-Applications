//
//  EmojyMemoryGameView.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/4/22.
//

import SwiftUI

struct EmojyMemoryGameView: View {
    
    @ObservedObject var game: EmojyMemoryGame
    
    init(_ game: EmojyMemoryGame) {
        self.game = game
    }
    
    @Namespace private var dealingNamespace
    
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojyMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojyMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func handlingUndealtCards() {
        for card in game.cards {
            deal(card)
        }
    }
    
    private func clearDealtCards() {
        dealt = []
    }
    
    private func dealAnimation(for card: EmojyMemoryGame.Card) -> Animation {
        var delay = 0.0
        if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (Constraints.totalDealDuration / Double(game.cards.count))
        }
        return Animation.easeOut(duration: Constraints.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: EmojyMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack {
                gameBody
                HStack {
                    restartBtn
                    Spacer()
                    shufflebtn
                }
                .padding(.horizontal)
            }
            deckBody
        }
        .padding()
        .navigationBarTitle(Text(game.theme), displayMode: .inline)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: {
            card in
            if isUndealt(card) || card.isMatched && card.isFold || game.isAllCardsMatched {
                Color.clear
            }
            else {
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(4)
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: .identity,
                            removal: .scale
                        ))
                    .onTapGesture(perform: {
                        withAnimation {
                            game.choose(card)
                        }
                    })
            }
        })
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) {
                card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .zIndex(zIndex(of: card))
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: .opacity,
                            removal: .identity
                        ))
            }
        }
        .frame(width: Constraints.undealtCardWidth, height: Constraints.undealtCardHeight)
        .foregroundColor(Constraints.color)
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    var restartBtn: some View {
        Button(action: {
            withAnimation {
                clearDealtCards()
                game.restartMemoryGame()
            }
        }, label: {
            Text("Restart")
        })
    }
    
    var shufflebtn: some View {
        Button(action: {
            withAnimation {
                game.shuffleCards()
            }
        }, label: {
            Text("Shuffle")
        })
    }
    
    private struct Constraints {
        static let aspectRatio: CGFloat = 2/3
        static let color: Color = .blue
        static let undealtCardHeight: CGFloat = 90
        static let undealtCardWidth: CGFloat = undealtCardHeight * aspectRatio
        static let dealDuration: Double = 0.25
        static let totalDealDuration: Double = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojyMemoryGame(with: EmojyMemoryGame.themes.first?.key ?? "Vehicles")
        EmojyMemoryGameView(game)
            .preferredColorScheme(.light)
        EmojyMemoryGameView(game)
            .preferredColorScheme(.dark)
    }
}
