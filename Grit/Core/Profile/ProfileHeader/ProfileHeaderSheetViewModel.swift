//
//  ProfileHeaderSheetViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/29/24.
//

import Foundation

final class ProfileHeaderSheetViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}
