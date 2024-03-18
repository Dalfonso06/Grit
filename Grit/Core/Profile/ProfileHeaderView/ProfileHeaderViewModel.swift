//
//  ProfileHeaderViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/14/24.
//

import Foundation

class ProfileheaderViewModel: ObservableObject {
    
    @Published var followers: Int
    @Published var following: Int
    
    init(followers: Int, following: Int) {
        self.followers = followers
        self.following = following
    }
    
}
