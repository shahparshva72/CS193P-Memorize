//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Parshva Shah on 6/19/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    init() {
        randomTheme = EmojiMemoryGame.themes.randomElement()!
        randomTheme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
    }
    
    private static var themes = [Theme(themeName: "Vehicles",
                        emojis: ["🚙", "🚕", "🚗", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🛺", "🚠", "🚃", "🚂", "🚀"],
                        numberOfPairsOfCards: 12,
                        themeColor: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)),
                  Theme(themeName: "Animals",
                        emojis: ["🐱", "🐈", "🐼", "🦁", "🐯", "🐀", "🐰", "🐨", "🦊", "🐴"],
                        numberOfPairsOfCards: 6,
                        themeColor: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)),
                  Theme(themeName: "Fruits",
                        emojis: ["🍒", "🍑", "🍇", "🍎", "🍉", "🍊", "🍏", "🍋", "🍌", "🍍"],
                        numberOfPairsOfCards: 7,
                        themeColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)),
                  Theme(themeName: "Faces",
                        emojis: ["😀", "😃", "😄", "😆", "😅", "😂", "🤣", "😍", "🥳", "😭", "😎", "🥸"],
                        numberOfPairsOfCards: 9,
                        themeColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)),
                  Theme(themeName: "Birds",
                        emojis: ["🕊", "🦅", "🦆", "🦜", "🐥", "🦢", "🐓", "🦃", "🦉", "🐧", "🦤", "🦩", "🦚"],
                        numberOfPairsOfCards: 8,
                        themeColor: #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)),
                  Theme(themeName: "Sports",
                        emojis: ["⚽️", "🏀", "🥎", "🏈", "🎱", "🏓", "🏸", "🏏", "🏹", "🥊", "🛼", "🏒", "🥋"],
                        numberOfPairsOfCards: 10,
                        themeColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    var cards: [Card] {
        model.cards
    }
    
    private var randomTheme: Theme
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func createNewGame(){
        randomTheme = EmojiMemoryGame.themes.randomElement()!
        randomTheme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
    }
    
    var themeName: String {
        randomTheme.themeName
    }
    
    var themeColor: UIColor {
        randomTheme.themeColor
    }
    
    var gameScore: Int {
        model.gameScore
    }
}
