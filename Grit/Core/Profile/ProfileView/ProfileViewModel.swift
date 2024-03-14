//
//  ProfileViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/13/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var fullname: String
    @Published var followers: Int
    @Published var following: Int
    
    init(fullname: String, followers: Int, following: Int) {
        self.fullname = fullname
        self.followers = followers
        self.following = following
    }
    
}
