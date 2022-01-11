//
//  GameThemeSelectRowView.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/11/22.
//

import SwiftUI

struct GameThemeSelectRowView: View {
    var themeName: String
    var emojyList: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(themeName)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            LazyHStack {
                ForEach(emojyList, id: \.self) { emojy in
                    Text(emojy)
                }
            }
            .clipped()
        }
    }
}

struct GameThemeSelectRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameThemeSelectRowView(
            themeName: "Vehicles",
            emojyList: EmojyMemoryGame.vehicles)
    }
}
