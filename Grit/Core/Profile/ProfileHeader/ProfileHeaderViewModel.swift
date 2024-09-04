//
//  ProfileHeaderViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/18/24.
//

import Foundation

final class ProfileHeaderViewModel: ObservableObject {
    
    @Published var user: User
    @Published var userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol, user: User) {
        self.userService = userService
        self.user = user
    }
    
}
