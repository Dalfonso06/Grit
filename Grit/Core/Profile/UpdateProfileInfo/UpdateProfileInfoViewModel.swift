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
    @Published var userSession: UserSession

    @Published var userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol, userSession: UserSession) {
        self.userService = userService
        self.userSession = userSession
        self.firstName = userSession.user?.firstName ?? ""
        self.lastName = userSession.user?.lastName ?? ""
        self.email = userSession.user?.email ?? ""
    }
    
    func saveChanges(completion: @escaping () -> Void) {
        guard hasChanges else {
            print("There are no changes")
            return
        }
        
        let updatedUser = User(
            uid: (self.userSession.user?.uid)!,
            email: email,
            photoUrl: self.userSession.user?.photoUrl,
            firstName: firstName,
            lastName: lastName,
            followers: self.userSession.user?.followers,
            following: self.userSession.user?.following,
            photoData: self.userSession.user?.photoData
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
        self.hasChanges = self.firstName != self.userSession.user?.firstName || self.lastName != self.userSession.user?.lastName || self.email != self.userSession.user?.email
    }
}
