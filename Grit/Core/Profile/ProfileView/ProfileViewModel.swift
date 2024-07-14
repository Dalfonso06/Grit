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
    @Published var workouts: [Workout]
    
    init(firstname: String, profilePicture: String, workouts: [Workout]) {
        self.firstname = firstname
        self.profilePicture = profilePicture
        self.workouts = workouts
        
        print(workouts)
    }
    
}
