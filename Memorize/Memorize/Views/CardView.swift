//
//  CardView.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/4/22.
//

import SwiftUI

struct CardView: View {
    private var card: EmojyMemoryGame.Card
    
    @State private var animatedBonusTimeRemaining: Double = 0
    
    init(_ card: EmojyMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader(content: {geometry in
            
// MARK: Default Implementation
//            ZStack(content: {
//                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
//                if card.isFold {
//                    shape
//                        .foregroundColor(DrawingConstants.fillColor)
//                }
//                else {
//                    shape
//                        .fill()
//                        .foregroundColor(DrawingConstants.backgroundColor)
//                    shape
//                        .strokeBorder()
//                        .foregroundColor(DrawingConstants.strokeColor)
//                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 45 - 90), clockwise: false)
//                        .padding(5)
//                        .foregroundColor(.red)
//                        .opacity(0.5)
//                    Text(card.content)
//                        .font(font(in: geometry.size))
//                }
//            })
         
            
// MARK: View Modifier Implementation - 01
//            ZStack(content: {
//                Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 45 - 90), clockwise: false)
//                    .padding(5)
//                    .foregroundColor(.red)
//                    .opacity(0.5)
//                Text(card.content)
//                    .font(font(in: geometry.size))
//                })
//            .modifier(Cardify(isFold: card.isFold))
//            })
 
            
// MARK: View Modifier Implementation - 02
            ZStack(content: {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: (1-animatedBonusTimeRemaining)*360 - 90), clockwise: false)
                            .onAppear {
                                animatedBonusTimeRemaining = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusTimeRemaining = 0
                                }
                            }
                    }
                    else {
                        Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: (1-card.bonusRemaining)*360 - 90), clockwise: false)
                    }
                }
                .padding(5)
                .foregroundColor(.red)
                .opacity(0.5)
                
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
//                    .font(font(in: geometry.size))
            })
            .cardify(isFold: card.isFold)
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        (min(size.width, size.height) * DrawingConstants.fontScale) / DrawingConstants.fontSize
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let fontScale: CGFloat = 0.75
        static let fontSize: CGFloat = 32
        static let fillColor = Color.blue
        static let strokeColor = Color.blue
        static let backgroundColor = Color.white
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(EmojyMemoryGame.Card(id: 1, isFold: true, isMatched: false, content: EmojyMemoryGame.vehicles[0]))
    }
}
