//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var container: DependencyContainer
    @Published var firstname: String = "Insert Name"
    @Published var profilePicture: String = "Profile Url"
    @Published var workouts: [Workout] = []
    
    var onLogout: () -> Void
    
    init(container: DependencyContainer, onLogout: @escaping () -> Void) {
        self.container = container
        self.onLogout = onLogout
    }
    
}
