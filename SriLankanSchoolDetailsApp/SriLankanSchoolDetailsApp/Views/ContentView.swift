//
//  ContentView.swift
//  SriLankanSchoolDetailsApp
//
//  Created by Erantha Welikala on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelData: ModelData = ModelData()
    
    var body: some View {
        NavigationView {
            SchoolListView()
                .navigationTitle("Schools")
        }
        .environmentObject(modelData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
