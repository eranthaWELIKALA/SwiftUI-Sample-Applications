//
//  SwiftUILearningApp.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/26/21.
//

import SwiftUI

@main
struct SwiftUILearningApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
        // Adding App State Callbacks
        .onChange(of: scenePhase) {
            (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("App State: Background")
            case .inactive:
                print("App State: Inactive")
            case .active:
                print("App State: Active")
            @unknown default:
                print("App State: Unknown")
            }
        }
    }
}

struct SwiftUILearningApp_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
