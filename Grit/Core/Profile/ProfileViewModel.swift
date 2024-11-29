//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation
import Dependency

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var workouts: [Workout] = []
    
    @Dependency(\.userService) var userService: UserServiceProtocol
    
    var updateLoginStatus: () -> Void
    
    init(user: User, updateLoginStatus: @escaping () -> Void) {
        self.user = user
        self.updateLoginStatus = updateLoginStatus
    }
    
    func updateUserInformation() -> Void {
        Task {
            do {
                let userData = try await userService.getUserData(uid: user.uid)
                DispatchQueue.main.async {
                    self.user = userData
                }
            } catch {
                print("Something went wrong fetching user data: \(error)")
            }
        }
    }
}
