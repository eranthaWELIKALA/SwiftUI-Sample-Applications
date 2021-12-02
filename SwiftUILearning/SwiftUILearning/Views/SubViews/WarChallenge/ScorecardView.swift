//
//  ScorecardView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/29/21.
//

import SwiftUI

struct ScorecardView: View {
    var playerName: String
    @Binding var playerScore: Int
    var body: some View {
        VStack {
            Text(playerName)
            Text("\(playerScore)")
        }
        .padding()
        .background(Color.green)
        .cornerRadius(10)
    }
}
