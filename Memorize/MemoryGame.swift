//
//  MemorizeGame.swift
//  Memorize
//
//  Created by David on 2023/11/6.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory:(Int)->CardContent){
        cards = []
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{ cards.indices.filter{ index in cards[index].isFaceUp }.only }
        set{ cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { cardToCheck in cardToCheck.id == card.id }){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    //indexOfTheOneAndOnlyFaceUpCard = nil
                }else{
                    /*for index in cards.indices{
                        cards[index].isFaceUp = false
                    }*/
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
        print("Choose  \(card)")
    }
    
    //function for finding index of the same card
    /*private func index(of card: Card) ->Int? {
        for index in cards.indices {
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    */
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var debugDescription: String{
            "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? " matched" : "")"
        }
        
        var id: String
        
        //static func == (lhs: Card, rhs: Card) -> Bool {
        //    return lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched && lhs.content == rhs.content
        //}
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
