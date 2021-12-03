//
//  SecondView.swift
//  SwiftUINavigation
//
//  Created by Erantha Welikala on 12/3/21.
//

import SwiftUI

// First Option + Second Option
//struct SecondView: View {
//    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
//     @Binding var rootPresenting: Bool
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            NavigationLink(
//                destination: ThirdView(rootPresenting: $rootPresenting),
//                label: {
//                    Text("Go to ThirdView")
//                        .foregroundColor(.blue)
//                })
//            Button(action: {
//                // Back Button
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Text("Back")
//            })
//            
//            Button(action: {
//                // Go to RootView
//                rootPresenting = false
//            }, label: {
//                Text("Go to RootView")
//            })
//        }
//        .navigationTitle(Text("Second View"))
//    }
//}

// First Option + Third Option
struct SecondView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Environment(\.rootPresentation) var rootPresenting: Binding<Bool>
    
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(
                destination: ThirdView(),
                label: {
                    Text("Go to ThirdView")
                        .foregroundColor(.blue)
                })
            Button(action: {
                // Back Button
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Back")
            })
            
            Button(action: {
                rootPresenting.wrappedValue = false
                
            }, label: {
                Text("Go to RootView")
            })
        }
        .navigationTitle(Text("Second View"))
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
//        Second Option
//        SecondView(rootPresenting: Binding.constant(false))
        
//        Third Option
        ThirdView()
    }
}
