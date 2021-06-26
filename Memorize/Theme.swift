//
//  Theme.swift
//  Memorize
//
//  Created by Parshva Shah on 6/26/21.
//

import Foundation
import UIKit

struct Theme {
    internal init(themeName: String, emojis: [String], numberOfPairsOfCards: Int, themeColor: UIColor) {
        self.themeName = themeName
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards //Task 7
        self.themeColor = themeColor
    }
    
    var themeName: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var themeColor: UIColor
}
