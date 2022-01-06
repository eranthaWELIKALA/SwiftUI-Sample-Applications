//
//  CardView.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/4/22.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State private var isFold: Bool = true
    var body: some View {
        ZStack(content: {
            let shape = RoundedRectangle(cornerRadius: 20)
            let fillColor = Color.blue
            let strokeColor = Color.blue
            let backgroundColor = Color.white
            if isFold {
                shape
                    .foregroundColor(fillColor)
            }
            else {
                shape
                    .fill()
                    .foregroundColor(backgroundColor)
                shape
                    .strokeBorder()
                    .foregroundColor(strokeColor)
                Text(content)
                    .font(.largeTitle)
            }
        }).onTapGesture(perform: {
            isFold.toggle()
        })
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "✈️")
    }
}
