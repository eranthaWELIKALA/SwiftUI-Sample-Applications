//
//  Cardify.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/10/22.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    var animatableData: Double {
        get {
            rotation
        }
        set {
            rotation = newValue
        }
    }
    
    var rotation: Double // in Degrees
    
    init(isFold: Bool) {
        rotation = isFold ? 180 : 0
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation > 90 {
                shape
                    .foregroundColor(DrawingConstants.fillColor)
            }
            else {
                shape
                    .fill()
                    .foregroundColor(DrawingConstants.backgroundColor)
                shape
                    .strokeBorder()
                    .foregroundColor(DrawingConstants.strokeColor)
            }
            content
                .opacity(rotation > 90 ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let fontScale: CGFloat = 0.75
        static let fillColor = Color.blue
        static let strokeColor = Color.blue
        static let backgroundColor = Color.white
    }
}

extension View {
    func cardify(isFold: Bool) -> some View {
        self.modifier(Cardify(isFold: isFold))
    }
}
