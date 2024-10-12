//
//  ProfileInfoViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/12/24.
//

import Foundation

final class ProfileInfoViewModel: ObservableObject {
    
    @Published var user: User
    @Published var userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol, user: User) {
        self.userService = userService
        self.user = user
    }
}
