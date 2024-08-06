//
//  AuthenticationService.swift
//  Grit
//
//  Created by Daniel Alfonso on 7/30/24.
//

import Foundation
import FirebaseAuth

// MARK: Notes (Remove)
// weak self allows the method to return and stop on de-init of the service preventing memory leaks
// authResult and error are the inputs to a completion function, that syntax is used to essentially pass in a function into the function

class AuthenticationService: AuthenticationServiceProtocol {
    
    func signIn(email: String, password: String) async throws -> User {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        let user = User(user: authResult.user)
        return user
    }
    
    func signUp(email: String, password: String) async throws -> User {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let user = User(user: authResult.user)
        return user
    }
    
    func deleteUser() async throws -> Bool {
        let user = Auth.auth().currentUser
        try await user?.delete()
        return true
    }
}
