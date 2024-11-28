//
//  MainViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/7/24.
//

import Foundation
import Dependency

final class MainViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    @Published var user: User?
    
    @Dependency(\.authService) var authService: AuthenticationServiceProtocol
    @Dependency(\.userService) var userService: UserServiceProtocol
        
    func updateLoginStatus() -> Void {
        self.isLoggedIn = authService.isLoggedIn()
    }
}
