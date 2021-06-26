//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Parshva Shah on 5/28/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
