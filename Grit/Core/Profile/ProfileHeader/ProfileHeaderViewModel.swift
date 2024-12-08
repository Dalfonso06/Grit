//
//  ProfileHeaderViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/18/24.
//

import Foundation

final class ProfileHeaderViewModel: ObservableObject {
    
    @Published var userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
}
