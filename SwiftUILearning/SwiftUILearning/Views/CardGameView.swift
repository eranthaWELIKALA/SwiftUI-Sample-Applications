//
//  CardGameView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/26/21.
//

import SwiftUI

struct CardGameView: View {
    
    @State var isAlertPresent: Bool = false
    @State var winnerMsg: String = ""
    
    @State var isPlayerOneTurn: Bool = true
    @State var cardOneValue: Int = 3
    @State var playerOneScore: Int = 0
    @State var cardTwoValue: Int = 5
    @State var playerTwoScore: Int = 0
    @State var turns: Int = 5
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Image("heart")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                }
                
                Text("\(isPlayerOneTurn ? "Human Player": "CPU Player") turn")
                Text("Remaining Rounds: \(turns)")
                HStack {
                    CardView(type: CardType.diamonds, value: $cardOneValue)
                    Spacer()
                    CardView(type: CardType.spades, value: $cardTwoValue)
                }
                
                Button(action: {
                    let randomNumber = Int.random(in: 1 ..< 10)
                    if isPlayerOneTurn {
                        cardOneValue = randomNumber
                    }
                    else {
                        cardTwoValue = randomNumber
                        if cardOneValue > cardTwoValue {
                            playerOneScore+=1
                        }
                        if cardTwoValue > cardOneValue {
                            playerTwoScore+=1
                        }
                        turns -= 1
                        if (turns <= 0) {
                            if (playerOneScore > playerTwoScore) {
                                winnerMsg = "Player One Wins"
                                print("Player One Wins")
                            }
                            else if (playerOneScore < playerTwoScore) {
                                winnerMsg = "Player Two Wins"
                                print("Player Two Wins")
                            }
                            else {
                                winnerMsg = "Match is drawn"
                                print("Match is drawn")
                            }
                            isAlertPresent = true
                            turns = 5
                            playerOneScore = 0
                            playerTwoScore = 0
                        }
                    }
                    isPlayerOneTurn.toggle()
                }, label: {
                    Text("DEAL")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                HStack(spacing: 0) {
                    ScorecardView(playerName: "Player 1", playerScore: $playerOneScore).frame(maxWidth: .infinity)
                    ScorecardView(playerName: "CPU", playerScore: $playerTwoScore).frame(maxWidth: .infinity)

                }
            }.navigationTitle("Card Game")
            .alert(isPresented: $isAlertPresent, content: {
                Alert(title: Text("War Challenge"), message: Text(winnerMsg), dismissButton: .cancel())
            })
        }
    }
}

struct WarChallenge_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}


enum CardType: String {
    case diamonds = "diamond.fill"
    case spades = "suit.spade.fill"
    case clubs = "suit.club.fill"
    case hearts = "heart.fill"
}
