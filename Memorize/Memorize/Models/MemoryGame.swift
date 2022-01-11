//
//  MemoryGame.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/6/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card] = []
    private var unFoldedCardIndex: Int? {
        get {
            cards.indices.filter{
                !cards[$0].isMatched && !cards[$0].isFold
                
            }.oneAndOnly
        }
        set {
            cards.indices.forEach{
                if newValue != nil {
                    (cards[$0].isFold = ($0 != newValue))
                }
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    mutating func shuffleCards() {
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        if let cardIndex = index(of: card) {
            if let unFoldedCardIndex = self.unFoldedCardIndex {
                if (cardIndex == unFoldedCardIndex) {
                    self.unFoldedCardIndex = nil
                    return
                }
                if (cardIndex != unFoldedCardIndex && card.content == cards[unFoldedCardIndex].content) {
                    markAsMatched([cardIndex, unFoldedCardIndex])
                    self.unFoldedCardIndex = nil
                    return
                }
            }
            self.unFoldedCardIndex = cardIndex
        }
        
        print(cards)
    }
    
    func isAllCardsMatched() -> Bool {
        cards.indices.filter{
            cards[$0].isMatched
            
        }.count == cards.count
    }
    
    private mutating func toggleCard(_ cardIndex: Int) {
        if !cards[cardIndex].isMatched {
            cards[cardIndex].isFold.toggle()
        }
    }
    
    private mutating func markAsMatched(_ matchedCards: [Int]) {
        for cardIndex in matchedCards {
            cards[cardIndex].isMatched = true
        }
    }
    
    private func index(of card: Card) -> Int? {
        return cards.firstIndex(where: { $0.id == card.id })
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFold: Bool = true {
            didSet {
                if isFold {
                    stopUsingBonusTime()
                }
                else {
                    startUsingBonusTime()
                }
            }
        }
        var isMatched: Bool = false {
            didSet {
                if isMatched {
                    isFold = false
                }
            }
        }
        var content: CardContent
        
        var bonusTimeLimit: TimeInterval = 6
        
        private var unFoldedTime: TimeInterval {
            if let lastUnFoldedDate = self.lastUnFoldedDate {
                return pastUnFoldedTime + Date().timeIntervalSince(lastUnFoldedDate)
            }
            else {
                return pastUnFoldedTime
            }
        }
        
        var lastUnFoldedDate: Date?
        
        var pastUnFoldedTime: TimeInterval = 0
        
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - unFoldedTime)
        }
        
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        var isConsumingBonusTime: Bool {
            !isFold && !isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastUnFoldedDate == nil {
                lastUnFoldedDate = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastUnFoldedTime = unFoldedTime
            self.lastUnFoldedDate = nil
        }
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return first
        }
        else {
            return nil
        }
    }
}
