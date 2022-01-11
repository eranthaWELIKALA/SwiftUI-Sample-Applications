//
//  GameThemeSelectView.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/10/22.
//

import SwiftUI

struct GameThemeSelectView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(EmojyMemoryGame.themes.keys), id: \.self) {
                    themeName in
                    NavigationLink(
                        destination:
                            EmojyMemoryGameView(EmojyMemoryGame(with: themeName)),
                        label: {
                            GameThemeSelectRowView(themeName: themeName, emojyList: EmojyMemoryGame.themes[themeName]!)
                        })
                    
                }
            }
            .padding()
            .navigationTitle("Game Themes")
        }
    }
}

struct GameThemeSelectView_Previews: PreviewProvider {
    static var previews: some View {
        GameThemeSelectView()
    }
}
