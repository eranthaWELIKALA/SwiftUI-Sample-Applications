//
//  ThirdView.swift
//  SwiftUINavigation
//
//  Created by Erantha Welikala on 12/3/21.
//

import SwiftUI

// First Option + Second Option
//struct ThirdView: View {
//    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
//     @Binding var rootPresenting: Bool
//    var body: some View {
//        VStack(spacing: 20) {
//            Button(action: {
//                // Back Button
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Text("Back")
//            })
//            Button(action: {
//                // Go to RootView
//                rootPresenting = false
//            }, label: {
//                Text("Go to RootView")
//            })
//        }
//        .navigationTitle(Text("Third View"))
//    }
//}

// First Option + Third Option
struct ThirdView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Environment(\.rootPresentation) var rootPresenting: Binding<Bool>
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                // Back Button
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Back")
            })
            Button(action: {
                // Go to RootView
                rootPresenting.wrappedValue = false
            }, label: {
                Text("Go to RootView")
            })
        }
        .navigationTitle(Text("Third View"))
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
//        Second Option
//        ThirdView(rootPresenting: Binding.constant(false))
        
//        Third Option
        ThirdView()
    }
}
