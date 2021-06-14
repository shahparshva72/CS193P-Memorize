//
//  ContentView.swift
//  Memorize
//
//  Created by Parshva Shah on 5/28/21.
//

import SwiftUI

struct ContentView: View {
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
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount].shuffled(), id: \.self){ emoji in
                        HStack {
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                .foregroundColor(.red)
            }
            Spacer(minLength: 20)
            HStack {
                vehicleButton
                Spacer()
                animalsButton
                Spacer()
                fruitsButton
            }
            .padding()
        }
        .padding(.horizontal)
    }
    
//    func widthThatBestFits(cardCount: Int) -> CGFloat {
//
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
