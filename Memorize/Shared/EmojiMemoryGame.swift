//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew on 2020/8/27.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    private static let themes = [
        MemoryGame<String>.Theme(name: "Halloween", contents: ["👻", "🎃", "🕷", "💀"], color: .orange),
        MemoryGame<String>.Theme(name: "Animal", contents: ["🦁", "🦊", "🐷", "🐸", "🦄", "🐶", "🐼", "🐧", "🐡"], color: .blue),
        MemoryGame<String>.Theme(name: "Faces", contents: ["😍", "🥶", "😱", "🤯", "🥳", "🤬", "😂", "🤤", "🧐"], color: .yellow),
        MemoryGame<String>.Theme(name: "Sports", contents: ["⚽️", "🏀", "🏈", "⚾️", "🏉", "🎱", "🏓", "🏸", "🎣", "🏹"], color: .red),
        
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        let theme = EmojiMemoryGame.themes.randomElement()!;
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs, theme: theme) { pairIndex in
            theme.contents[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var theme: MemoryGame<String>.Theme {
        model.theme
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func startNewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}


