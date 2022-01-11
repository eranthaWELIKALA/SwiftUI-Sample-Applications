//
//  ButtonViews.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/7/22.
//

import SwiftUI

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
