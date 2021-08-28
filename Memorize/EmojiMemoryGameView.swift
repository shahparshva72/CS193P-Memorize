//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Parshva Shah on 5/28/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    // TODO:- Continue from 49:00 from Lecture 6
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(game.themeName).font(.largeTitle)
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                if card.isMatched && !card.isFaceUp {
                    Rectangle().opacity(0.0)
                } else {
                    CardView(card: card, themeColor: game.themeColor)
                        .padding(4)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .foregroundColor(Color(game.themeColor))
            
            Text("Score: \(game.gameScore)")
                .font(.largeTitle)
            
            Spacer(minLength: 10)
            
            Button(action: {
                game.createNewGame()
            }, label: {
                Text("New Game")
                    .font(.title)
            })
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let themeColor: UIColor
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 100)).padding(5).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape.fill().foregroundColor(Color(themeColor))
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}

// MARK: - Past Code for reference

/*
 Spacer(minLength: 20)
 HStack {
 vehicleButton
 Spacer()
 animalsButton
 Spacer()
 fruitsButton
 }
 .padding()
 
 var content: String
 @State var isFaceUp: Bool = true
 
 .onTapGesture {
 isFaceUp = !isFaceUp
 }
 
 @State var emojis = ["🚙", "🚕", "🚗", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🛺", "🚠", "🚃", "🚂", "🚀", "🚁", "🛶", "⛵️", "🚤"]
 var vehicleEmojis = ["🚙", "🚕", "🚗", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🛺", "🚠", "🚃", "🚂", "🚀", "🚁", "🛶", "⛵️", "🚤"]
 var animalEmojis = ["🐱", "🐈", "🐼", "🦁", "🐯", "🐀", "🐰", "🐨", "🦊", "🐴"]
 var fruitEmojis = ["🍒", "🍑", "🍇", "🍎", "🍉", "🍊", "🍏", "🍋", "🍌", "🍍"]
 @State var emojiCount = 24
 
 
 var add: some View {
 Button(action: {
 if emojiCount < emojis.count {
 emojiCount += 1
 }
 }, label: {
 Image(systemName: "plus.circle")
 .font(.largeTitle)
 })
 }
 
 var remove: some View {
 Button(action: {
 if emojiCount > 1 {
 emojiCount -= 1
 }
 }, label: {
 Image(systemName: "minus.circle")
 })
 }
 
 var shuffle: some View {
 Button(action: {
 emojiCount = Int.random(in: 1..<emojis.count)
 }, label: {
 Text("Shuffle")
 })
 }
 
 var vehicleButton: some View {
 Button(action: {
 emojis = vehicleEmojis
 emojiCount = Int.random(in: 4..<vehicleEmojis.count)
 }) {
 VStack {
 Image(systemName: "car").font(.largeTitle)
 Text("Vehicles")
 }
 }
 }
 
 var animalsButton: some View {
 Button(action: {
 emojis = animalEmojis
 emojiCount = Int.random(in: 4..<animalEmojis.count)
 }) {
 VStack {
 Image(systemName: "hare").font(.largeTitle)
 Text("Animals")
 }
 }
 }
 
 var fruitsButton: some View {
 Button(action: {
 emojis = fruitEmojis
 emojiCount = Int.random(in: 4..<fruitEmojis.count)
 }) {
 VStack {
 Image(systemName: "leaf").font(.largeTitle)
 Text("Fruit")
 }
 }
 }
 
 ScrollView {
 LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
 ForEach(game.cards, id: \.id){ card in
 HStack {
 CardView(card: card, themeColor: game.themeColor)
 .aspectRatio(2/3, contentMode: .fit)
 .onTapGesture {
 game.choose(card)
 }
 }
 }
 }
 .foregroundColor(Color(game.themeColor))
 }
 
 ScrollView {
 LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
 ForEach(game.cards, id: \.id){ card in
 HStack {
 CardView(card: card, themeColor: game.themeColor)
 .aspectRatio(2/3, contentMode: .fit)
 .onTapGesture {
 game.choose(card)
 }
 }
 }
 }
 .foregroundColor(Color(game.themeColor))
 }
 
 */
