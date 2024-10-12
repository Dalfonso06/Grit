//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var container: DependencyContainer
    @Published var user: User
    @Published var workouts: [Workout] = []
    
    var updateLoginStatus: () -> Void
    
    var userService: UserServiceProtocol {
        container.userService
    }
    
    init(container: DependencyContainer, user: User, updateLoginStatus: @escaping () -> Void) {
        self.container = container
        self.user = user
        self.updateLoginStatus = updateLoginStatus
    }
    
}
