//
//  UpdateProfileInfoViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/16/24.
//

import Foundation

final class UpdateProfileInfoViewModel: ObservableObject {
    
    // Edit fields and track the changes
    @Published var firstName: String {
        didSet {
            self.compareFields()
        }
    }
    @Published var lastName: String {
        didSet {
            self.compareFields()
        }
    }
    @Published var email: String {
        didSet {
            self.compareFields()
        }
    }
    
    @Published var hasChanges: Bool = false
    
    @Published var user: User
    @Published var userService: UserServiceProtocol
    
    init(user: User, userService: UserServiceProtocol) {
        self.user = user
        self.userService = userService
        self.firstName = user.firstName!
        self.lastName = user.lastName!
        self.email = user.email!
    }
    
    func saveChanges(completion: @escaping () -> Void) {
        guard hasChanges else {
            print("There are no changes")
            return
        }
        
        let updatedUser = User(
            uid: self.user.uid,
            email: email,
            photoUrl: self.user.photoUrl,
            firstName: firstName,
            lastName: lastName,
            followers: self.user.followers,
            following: self.user.following,
            photoData: self.user.photoData
        )
        
        Task {
            do {
                try await userService.updateUser(user: updatedUser)
                DispatchQueue.main.async {
                    print("User successfully updated.")
                    completion()
                }
            } catch {
                print("Failed to update user: \(error.localizedDescription)")
            }
        }
    }
    
    private func compareFields() {
        self.hasChanges = self.firstName != user.firstName || self.lastName != user.lastName || self.email != user.email
    }
}
