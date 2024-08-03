//
//  AuthenticationProtocol.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/2/24.
//

import Foundation

protocol AuthenticationServiceProtocol {
    func signIn(email: String, password: String) async throws -> User
    func signUp(email: String, password: String) async throws -> User
}
