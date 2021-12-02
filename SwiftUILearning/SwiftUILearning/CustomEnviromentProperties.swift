//
//  CustomEnviromentProperties.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 12/1/21.
//

import Foundation
import SwiftUI

struct RootPresentationKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(true)
}
