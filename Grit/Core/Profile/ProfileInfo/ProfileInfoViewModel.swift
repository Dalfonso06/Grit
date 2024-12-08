//
//  ProfileInfoViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/12/24.
//

import Foundation

final class ProfileInfoViewModel: ObservableObject {
    
    @Published var userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
}
