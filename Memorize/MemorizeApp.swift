//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Parshva Shah on 5/28/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
