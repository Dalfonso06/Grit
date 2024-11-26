//
//  Dependency.swift
//  Grit
//
//  Created by Daniel Alfonso on 11/26/24.
//

import Foundation
import Dependency

// MARK: - Authentication Service
private struct AuthenticationServiceKey: DependencyKey {
    static var currentValue: AuthenticationServiceProtocol = AuthenticationService()
}

// MARK: - User Service
private struct UserServiceKey: DependencyKey {
    static var currentValue: UserServiceProtocol = UserService()
}

// MARK: - Dependency values
extension DependencyValues {
    var authService: AuthenticationServiceProtocol {
        get { Self[AuthenticationServiceKey.self] }
        set { Self[AuthenticationServiceKey.self] = newValue }
    }
    var userService: UserServiceProtocol {
        get { Self[UserServiceKey.self] }
        set { Self[UserServiceKey.self] = newValue }
    }
}
