//
//  MemorizeApp.swift
//  Memorize
//
//  Created by David on 2023/10/18.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMeomoryGameView(viewModel:game)
        }
    }
}
