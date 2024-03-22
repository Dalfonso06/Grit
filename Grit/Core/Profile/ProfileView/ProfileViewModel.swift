//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var fullname: String
    @Published var profileHeaderViewModel: ProfileheaderViewModel
    
    init(fullname: String, profileHeaderViewModel: ProfileheaderViewModel) {
        self.fullname = fullname
        self.profileHeaderViewModel = profileHeaderViewModel
    }
    
}
