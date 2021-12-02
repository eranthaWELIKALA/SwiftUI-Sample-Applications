//
//  SlotGameView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/30/21.
//

import SwiftUI

// This view navigate back using Environment variable presentationMode
struct SlotGameView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var creditReducingLimit: Int = 100
    @State var selection: NavigationTag?
    @State var alertPresented: Bool = false
    @State var alert: Alert?
    @State var symbols: [SlotImage] = [SlotImage.apple, SlotImage.star, SlotImage.cherry]
    @State var colors: [Color] = [Color.white, Color.white, Color.white]
    @State var credit: Int = 1000
    @State var win: Bool = false
    var body: some View {
        ZStack {
            NavigationLink(
                destination: DashboardView(),
                tag: NavigationTag.dashboard,
                selection: $selection) {
                
            }
            Rectangle()
                .foregroundColor(Color.orange)
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Swift UI Slots!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Spacer()
                }
                .padding(.top, 40)
                
                Spacer()
                
                CreditView(credit, win: $win)
                Spacer()
                
                HStack {
                    Spacer()
                    SlotView($symbols[0], color: $colors[0])
                    SlotView($symbols[1], color: $colors[1])
                    SlotView($symbols[2], color: $colors[2])
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    credit -= creditReducingLimit
                    if (credit == 0) {
                        alert = Alert(title: Text("You lost"))
                        colors = [.red, .red, .red]
                        alertPresented = true
                    }
                    for i in (0 ..< symbols.count) {
                        symbols[i] = SlotImage.allCases.randomElement() ?? SlotImage.apple
                    }
                    
                    if (isAllSlotsEqual()) {
                        win = true
                        alert = Alert(title: Text("You win"), message: Text("Your score is \(credit)"), dismissButton: Alert.Button.default(Text("Dismis"), action: {
                            presentationMode.wrappedValue.dismiss()
                        }))
                        colors = [.green, .green, .green]
                        alertPresented = true
//                        selection = NavigationTag.dashboard
                    }
                    else {
                        win = false
                    }
                }, label: {
                    Text("Spin")
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .background(Color.red)
                        .cornerRadius(20)
                })
                .disabled(isAllSlotsEqual())
                
                Button(action: {
                    resetGame()
                }, label: {
                    Text("New Game")
                        .foregroundColor(.white)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .cornerRadius(20)
                })
                
                Spacer()
            }
        }
        .animation(.easeOut(duration: 1))
        .alert(isPresented: $alertPresented, content: {
            return (alert ?? Alert(title: Text("Slot Game")))
        })
    }
    
    func isAllSlotsEqual() -> Bool {
        return symbols
                .dropFirst()
                .allSatisfy(
                    { $0 == symbols.first }
                )
    }
    
    func resetGame() {
        win = false
        credit = 1000
        symbols = [SlotImage.apple, SlotImage.star, SlotImage.cherry]
        colors = [Color.white, Color.white, Color.white]
    }
}

struct SlotGameView_Previews: PreviewProvider {
    static var previews: some View {
        SlotGameView()
    }
}

enum SlotImage: String, CaseIterable {
    case apple = "slotgame.apple"
    case star = "slotgame.star"
    case cherry = "slotgame.cherry"
}
