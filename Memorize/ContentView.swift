//
//  ContentView.swift
//  Memorize
//
//  Created by Parshva Shah on 5/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            Text(viewModel.themeName).font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards, id: \.id){ card in
                        HStack {
                            CardView(card: card, themeColor: viewModel.themeColor)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.choose(card)
                                }
                        }
                    }
                }
                .foregroundColor(Color(viewModel.themeColor))
            }
            
            Text("Score: \(viewModel.gameScore)")
                .font(.largeTitle)
            
            Spacer().frame(height: 10)
            
            Button(action: {
                viewModel.createNewGame()
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
        Group {
            ContentView(viewModel: game)
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let themeColor: UIColor
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill().foregroundColor(Color(themeColor))
            }
        }
    }
}

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
 
 
 */
