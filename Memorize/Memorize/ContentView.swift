//
//  ContentView.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojyCount = 4
    
    var emojis: [String] = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🚂", "✈️", "🚀", "🚁", "⛵️", "🛳"]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojyCount], id: \.self,  content: { emojy in
                        CardView(content: emojy)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            Spacer()
            HStack {
                RemoveCardButton(emojyCount: $emojyCount)
                Spacer()
                AddCardButton(emojyCount: $emojyCount,  maxEmojyCount: .constant(emojis.count))

            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct AddCardButton: View {
    @Binding var emojyCount: Int
    @Binding var maxEmojyCount: Int
    var body: some View {
        Button(action: {
            if emojyCount < maxEmojyCount {
                emojyCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct RemoveCardButton: View {
    @Binding var emojyCount: Int
    var body: some View {
        Button(action: {
            if emojyCount > 0 {
                emojyCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
}
