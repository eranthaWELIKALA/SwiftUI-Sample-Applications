//
//  ButtonLayer.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/29/21.
//

import SwiftUI

struct ButtonLayerView: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("Click Me", action: {
                print("Button is pressed")
            })
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
            Button("Click Me") {
                print("Button is pressed")
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
            Button(action: {
                print("Button is pressed")
            }, label: {
                HStack {
                    Image(systemName: "person")
                    Text("Login")
                }
            })
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
        }
    }
}

struct TestView: View {
    @State var presentAlert = false
    var body: some View {
        VStack {
            Spacer()
            ButtonLayerView()
            Button(action: {
                presentAlert = true
            }, label: {
                ZStack {
                    Image("heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("I Love You")
                        .font(.title)
                        .foregroundColor(.white)
                }
            })
            Spacer()
        }
        .background(Color.pink)
        .ignoresSafeArea(.all)
        .alert(isPresented: $presentAlert) {
            Alert(title: Text("Button Click"), message: Text("Heart btn was clicked"), dismissButton: .cancel())
        }
    }
}

struct ButtonLayerView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
