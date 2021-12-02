//
//  LoginView.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/29/21.
//

import SwiftUI
import Combine // To simplify asynchronus operations

struct LoginView: View {
    @State var isAuthenticated: Bool = false
    @State var user: User = User(username: "", password: "")
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Image(systemName: "person.fill")
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
            UserInputView(labelName: "Username", value: $user.username, type: .text)
            UserInputView(labelName: "Password", value: $user.password, type: .password)
            Button(action: {
                if Users.list.contains(user) {
                    print("Authenticated")
                    isAuthenticated = true
                }
            }, label: {
                Spacer()
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            })
            .frame(height: 50, alignment: .center)
            .background(Color.green)
            .cornerRadius(10)
            .padding()
            
            Spacer()
        }
        .ignoresSafeArea(.all)
        .background(Color.blue)
        .fullScreenCover(
            isPresented: $isAuthenticated,
            onDismiss: {
                isAuthenticated = false
            },
            content: {
                DashboardView()
            }
        )
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct UserInputView: View {
    var labelName: String
    @Binding var value: String
    var type: UserInputType
    var body: some View {
        VStack(alignment: .leading) {
            Text(labelName)
                .foregroundColor(Color.white)
            if (type == UserInputType.text) {
                TextField("", text: $value)
                    .autocapitalization(.none)
                    .frame(height: 50, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            else {
                SecureField("", text: $value)
                    .frame(height: 50, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                
            }
        }
        .padding()
    }
}

enum UserInputType {
    case text, password
}

class HttpAuth {
    var didChange = PassthroughSubject<HttpAuth, Never>()
    
    var authenticated = false {
        didSet {
            didChange.send(self)
        }
    }
}
