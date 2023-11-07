//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by David on 2023/11/6.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    private static let emoji = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉"]
    
    @Published private var model = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards:7) { pairIndex in
            if emoji.indices.contains(pairIndex){
                return emoji[pairIndex]
            }else{
                return "🚩"
            }
        }
    }
    
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    //Mark:-Intents
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card:MemoryGame<String>.Card){
        model.choose(card)
    }
}
