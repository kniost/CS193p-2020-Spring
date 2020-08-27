//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andrew on 2020/8/27.
//

import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    var theme: Theme
    var score: Int = 0
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    score -= cards[chosenIndex].isSeen ? 1 : 0;
                    score -= cards[potentialMatchIndex].isSeen ? 1 : 0
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, theme: Theme, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        self.theme = theme
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var faceup: Bool = false
        var isFaceUp: Bool {
            get {
                faceup
            }
            set {
                if faceup && !newValue && !isMatched {
                    isSeen = true
                }
                faceup = newValue
            }
        }
        var isMatched: Bool = false
        var isSeen: Bool = false
        var content: CardContent
        var id: Int
    }
    
    struct Theme {
        var name: String
        var contents: [CardContent]
        var color: Color
        var pairs: Int?
        var numberOfPairs: Int {
            pairs == nil ? Int.random(in: 2...contents.count) : pairs!
        }
    }

}
