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
    func resetPassword(email: String) async throws
    func deleteUser() async throws -> Bool
    func signOut() throws
    func isLoggedIn() -> Bool
}
