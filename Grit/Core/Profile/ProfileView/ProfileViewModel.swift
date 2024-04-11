//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var firstname: String
    
    init(firstname: String) {
        self.firstname = firstname
    }
    
}
