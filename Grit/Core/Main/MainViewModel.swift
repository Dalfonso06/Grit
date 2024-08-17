//
//  MainViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/7/24.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var container: DependencyContainer
    @Published var isLoggedIn: Bool = false
    
    var authService: AuthenticationServiceProtocol { container.authService }
    var userService: UserServiceProtocol { container.userService }
    
    init(container: DependencyContainer) {
        self.container = container
    }
    
    func updateLoginStatus() -> Void {
        self.isLoggedIn = authService.isLoggedIn()
    }
}
