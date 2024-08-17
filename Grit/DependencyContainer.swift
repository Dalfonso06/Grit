//
//  DependencyContainer.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/7/24.
//

import Foundation

final class DependencyContainer {
    let authService: AuthenticationServiceProtocol
    let userService: UserServiceProtocol
    
    init(authService: AuthenticationServiceProtocol, userService: UserServiceProtocol) {
        self.authService = authService
        self.userService = userService
    }
    
    convenience init() {
        self.init(
            authService: AuthenticationService(),
            userService: UserService()
        )
    }
}
