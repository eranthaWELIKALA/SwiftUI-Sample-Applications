//
//  ContentViewNavButton.swift
//  SwiftUINavigation-More
//
//  Created by Erantha Welikala on 12/3/21.
//

import SwiftUI

struct ContentViewNavButton: View {
    @State private var score = 0
    var body: some View {
        NavigationView {
            Text("User score: \(score)")
                .navigationBarTitle("Nav Buttons")
                .navigationBarItems(
                    leading: Button(action: {
                        score = 0
                    }, label: {
                        Text("Reset")
                    }),
                    trailing: HStack {
                        Button(action: {
                            if (score > 0) {
                                score -= 1
                            }
                        }, label: {
                            Text("Substract")
                        })
                        
                        Button(action: {
                            score += 1
                        }, label: {
                            Text("Substract")
                        })
                    })
        }
    }
}

struct ContentViewNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNavButton()
    }
}
