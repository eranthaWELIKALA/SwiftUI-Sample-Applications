//
//  EmojyMemoryGame.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/6/22.
//

import Foundation

class EmojyMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    // MARK: - Static Content
    static let themes = ["Vehicles": vehicles, "Fruits": fruits, "Smileys": smileys]
    static let vehicles = ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "âïļ", "ð", "ð", "âĩïļ", "ðģ", "ðļ"]
    static let fruits = ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðĨ­", "ð", "ðĨ"]
    static let smileys = ["ð", "ð", "ð", "ð", "ð", "ðĄ", "ðĪŊ", "ðĨķ", "ðą", "ð", "ðĪŠ", "ð§", "ðĪ", "ð­", "ðĪ", "ðĪĨ", "ðĪĒ", "ð·", "ðĪ", "ðĪ"]
    
    private static func createMemoryGame(theme themeName: String) -> MemoryGame<String> {
        MemoryGame<String>(
            numberOfPairsOfCards: 5,
            createCardContent: {
                pairIndex in
                if themeName == "Vehicles" {
                     return EmojyMemoryGame.vehicles[pairIndex]
                }
                else if themeName == "Fruits" {
                    return EmojyMemoryGame.fruits[pairIndex]
                }
                else {
                    return EmojyMemoryGame.smileys[pairIndex]
                }
            }
        )
    }
    
    // MARK: - Non-static content
    @Published private var model: MemoryGame<String>
    
    init(with themeName: String) {
        theme = themeName
        model = EmojyMemoryGame.createMemoryGame(theme: themeName)
    }
    
    var theme: String
    
    var cards: Array<Card> {
        model.cards
    }
    
    var isAllCardsMatched: Bool {
        model.isAllCardsMatched()
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
        
        // No need to use this if you are using the @Published property wrapper
        // objectWillChange.send()
    }
    
    func shuffleCards() {
        model.shuffleCards()
    }
    
    func restartMemoryGame() {
        model = EmojyMemoryGame.createMemoryGame(theme: "vehicles")
    }
}
