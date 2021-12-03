//
//  CustomEnvironmentProperties.swift
//  SwiftUINavigation
//
//  Created by Erantha Welikala on 12/3/21.
//

import Foundation
import SwiftUI

struct RootPresentationKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {
    var rootPresentation: Binding<Bool> {
        get {
            self[RootPresentationKey.self]
        }
        set {
            self[RootPresentationKey.self] = newValue
        }
    }
}
