//
//  HeartView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/26/21.
//

import SwiftUI
// This view navigate back using rootPresenting = false
struct HeartView: View {
    @Binding var rootPresenting: Bool
    
    var body: some View {
        VStack {
            Image("heart")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text("I want to give my whole heart to you if you are willing to accept")
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .cornerRadius(10)
            
            HStack(spacing: 40) {
                NavigationLink(
                    destination: CardGameView(),
                    label: {
                        Text("Accept")
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    })
                
                Button(action: {
                    rootPresenting = false
                }, label: {
                    Text("Reject")
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                })
            }
        }.navigationTitle("SwiftUI Learning")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView(rootPresenting: Binding.constant(false))
    }
}
