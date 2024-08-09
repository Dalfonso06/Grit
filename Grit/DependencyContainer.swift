//
//  DependencyContainer.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/7/24.
//

import Foundation

final class DependencyContainer {
    let authService: AuthenticationServiceProtocol
    
    init(authService: AuthenticationServiceProtocol) {
        self.authService = authService
    }
    
    convenience init() {
        self.init(authService: AuthenticationService())
    }
}
