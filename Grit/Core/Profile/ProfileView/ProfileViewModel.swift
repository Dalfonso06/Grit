//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var firstname: String
    @Published var profilePicture: String
    
    init(firstname: String, profilePicture: String) {
        self.firstname = firstname
        self.profilePicture = profilePicture
    }
    
}
