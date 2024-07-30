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

class AuthenticationService {
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            
            print(email)
            print(password)
            
            if let error = error {
                print("There was an error signing in \(error.localizedDescription)")
            }
            
            if let authResult = authResult {
                print(authResult.user.uid)
            }
        }
    }
    
}
