//
//  SchoolLogo.swift
//  SriLankanSchoolDetailsApp
//
//  Created by Erantha Welikala on 1/3/22.
//

import SwiftUI

struct LogoView: View {
    @State var logoName: String
    var body: some View {
        Image(logoName)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(logoName: "ds")
    }
}
