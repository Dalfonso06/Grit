//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation
import Dependency

class ProfileViewModel: ObservableObject {
    @Dependency(\.userService) var userService: UserServiceProtocol
    
    var updateLoginStatus: () -> Void
    
    init(updateLoginStatus: @escaping () -> Void) {
        self.updateLoginStatus = updateLoginStatus
    }
}
