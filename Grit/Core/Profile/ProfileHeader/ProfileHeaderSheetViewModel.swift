//
//  ProfileHeaderSheetViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/29/24.
//

import Foundation

final class ProfileHeaderSheetViewModel: ObservableObject {
    
    @Published var user: User
    @Published var userService: UserServiceProtocol
    
    init(user: User, userService: UserServiceProtocol) {
        self.user = user
        self.userService = userService
    }
    
}
