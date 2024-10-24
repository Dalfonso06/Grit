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
    
    private func compareFields() {
        self.hasChanges = self.firstName != user.firstName || self.lastName != user.lastName || self.email != user.email
    }
}
