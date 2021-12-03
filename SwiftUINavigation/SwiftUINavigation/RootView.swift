//
//  RootView.swift
//  SwiftUINavigation
//
//  Created by Erantha Welikala on 12/3/21.
//

import SwiftUI

    
// Second Option
//struct RootView: View {
//
//    @State private var rootPresenting: Bool = false
//
//    var body: some View {
//        NavigationView {
//            NavigationLink(
//                destination: SecondView(rootPresenting: $rootPresenting),
//                isActive: $rootPresenting,
//                label: {
//                    Text("Go to SecondView")
//                })
//                .navigationTitle(Text("Root View"))
//                .navigationBarTitleDisplayMode(.large)
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//    }
//}

// Third Option
struct RootView: View {
    
    @State private var rootPresenting: Bool = false
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: SecondView(),
                isActive: $rootPresenting,
                label: {
                    Text("Go to SecondView")
                })
                .navigationTitle(Text("Root View"))
                .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environment(\.rootPresentation, $rootPresenting)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
