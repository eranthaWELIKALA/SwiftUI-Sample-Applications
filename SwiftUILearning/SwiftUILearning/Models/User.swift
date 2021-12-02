//
//  User.swift
//  SwiftUILearning
//
//  Created by Erantha Welikala on 11/29/21.
//

import Foundation

struct User: Equatable {
    var username: String
    var password: String
    
    static func ==(lhs: User, rhs: User) -> Bool {
        if lhs.username == rhs.username && lhs.password == rhs.password {
            return true
        }
        return false
    }
}

struct Users {
    static var list: [User] = [
        User(username: "admin", password: "admin"),
        User(username: "eranthawelikala", password: "12345678")
    ]
}
