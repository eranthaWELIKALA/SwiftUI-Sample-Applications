//
//  CardView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/29/21.
//

import SwiftUI

struct CardView: View {
    var type: CardType
    @Binding var value: Int
    var color: Color
    init(type: CardType, value: Binding<Int>) {
        self.type = type
        self._value = value
        self.color = (type == CardType.spades || type == CardType.clubs ? .black: .red)
    }
    
    var body: some View {
        HStack(spacing: 25) {
            VStack(spacing:0) {
                Text("\(value)")
                    .font(.system(size: 48))
                Image(systemName: type.rawValue)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(height: 30)
                    .foregroundColor(color)
            }.frame(minWidth: .none, minHeight: 225, alignment: .top)
            
            VStack(spacing: 25) {
                Image(systemName: type.rawValue)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .foregroundColor(color)
                    .frame(height: 50)
            }.padding(.vertical, 50)
            
            VStack(spacing:0) {
                Image(systemName: type.rawValue)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(height: 30)
                    .foregroundColor(color)
                Text("\(value)")
                    .font(.system(size: 48))
            }.frame(minWidth: .none, minHeight: 225, alignment: .bottom)
        }
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(10)
    }
}
