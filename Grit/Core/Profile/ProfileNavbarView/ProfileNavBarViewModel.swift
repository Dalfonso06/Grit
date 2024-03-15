//
//  ProfileNavBarViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/14/24.
//

import Foundation

class ProfileNavBarViewModel: ObservableObject {
    
    @Published var fullname: String
    
    init(fullname: String) {
        self.fullname = fullname
    }
}
