//
//  CreditView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 12/2/21.
//

import SwiftUI

public struct CreditView: View {
    var credit: Int
    @Binding var win: Bool
    
    public init(_ credit: Int, win: Binding<Bool>) {
        self.credit = credit
        self._win = win
    }
    
    public var body: some View {
        Text("Credits: \(credit)")
            .padding(.all, 10)
            .background(win ? Color.green : Color.white)
            .animation(.none)
            .opacity(0.75)
            .cornerRadius(20)
            .scaleEffect(win ? 1.2 : 1)
            .animation(.spring(response: 1, dampingFraction: 0.25))
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView(1000, win: Binding.constant(true))
    }
}
