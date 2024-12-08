//
//  MainViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/7/24.
//

import Foundation
import Dependency
import SwiftUICore

final class MainViewModel: ObservableObject {
    
    @Published var userSession: UserSession
    @Published var isLoggedIn: Bool = false
    
    @Dependency(\.authService) var authService: AuthenticationServiceProtocol
    @Dependency(\.userService) var userService: UserServiceProtocol
    
    init(userSession: UserSession) {
        self.userSession = userSession
    }
        
    func updateLoginStatus() -> Void {
        self.userSession.isLoggedIn = authService.isLoggedIn()
        
        guard self.userSession.isLoggedIn, let uid = self.userSession.user?.uid, !uid.isEmpty else {
            self.userSession.user = nil
            return
        }
        
        Task {
            do {
                let userData = try await userService.getUserData(uid: uid)
                DispatchQueue.main.async {
                    self.userSession.user = userData
                }
            } catch {
                print("There was an error fetching user data: \(error.localizedDescription)")
            }
        }
    }
}
