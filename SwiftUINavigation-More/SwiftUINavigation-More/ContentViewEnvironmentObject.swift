//
//  ContentViewEnvironmentObject.swift
//  SwiftUINavigation-More
//
//  Created by Erantha Welikala on 12/3/21.
//

import SwiftUI

class User: ObservableObject{
    @Published var score = 0
}

struct ContentViewEnvironmentObject: View {
    @State var isChangeViewPresent: Bool = false
    @ObservedObject var user: User = User()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(
                    destination: ChangeView(),
                    isActive: $isChangeViewPresent) {
                    EmptyView()
                }
                
                Text("User score: \(user.score)")
                
                Button("Edit User Score") {
                    self.isChangeViewPresent = true
                }
                Spacer()
            }
            .navigationBarTitle("Content View")
            .environmentObject(user)

        }
    }
}

struct ChangeView: View {
    @EnvironmentObject var user: User
    var body: some View {
        VStack {
            Text("User score: \(user.score)")
            Button(action: {
                user.score += 1
            }, label: {
                Text("Increase")
            })
        }
        .navigationBarTitle("Change View")
    }
}

struct ContentViewEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewEnvironmentObject()
    }
}
