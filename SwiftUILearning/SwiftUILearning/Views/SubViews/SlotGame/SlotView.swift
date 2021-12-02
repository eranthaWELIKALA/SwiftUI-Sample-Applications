//
//  SlotView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 12/2/21.
//

import SwiftUI

public struct SlotView: View {
    @Binding var imageName: SlotImage
    @Binding var color: Color
//    private let transition: AnyTransition = .slide
//    private let transition: AnyTransition = .scale
    private let transition: AnyTransition = .move(edge: .bottom)
    
    init(_ imageName: Binding<SlotImage>, color: Binding<Color> = Binding.constant(.white)) {
        self._imageName = imageName
        self._color = color
    }
    
    public var body: some View {
        VStack {
            if imageName == SlotImage.apple {
                Image(SlotImage.apple.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(transition)
            }
            else if imageName == SlotImage.star {
                Image(SlotImage.star.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(transition)
            }
            else {
                Image(SlotImage.cherry.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(transition)
            }
        }
        .background(color.opacity(0.75))
        .cornerRadius(25)
    }
}



struct SlotView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView(Binding.constant(SlotImage.apple), color: Binding.constant(Color.red))
    }
}
