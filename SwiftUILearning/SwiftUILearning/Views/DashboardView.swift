//
//  DashboardView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 12/1/21.
//

import SwiftUI

struct DashboardView: View {
    
    @State private var rootPresenting: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: HeartView(rootPresenting: $rootPresenting),
                    isActive: $rootPresenting,
                    label: {
                        Text("Heart View")
                    })
                NavigationLink("Card Game", destination: CardGameView())
                NavigationLink("Slot Game", destination: SlotGameView())
            }.navigationTitle("Dashboard")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
