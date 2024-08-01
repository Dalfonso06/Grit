//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var firstname: String = "Insert Name"
    @Published var profilePicture: String = "Profile Url"
    @Published var workouts: [Workout] = []
    
    init() {
        
    }
    
}
