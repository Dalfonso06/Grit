//
//  ProfileImageViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/12/24.
//

import Foundation

final class ProfileImageViewModel: ObservableObject {
    
    @Published var imageData: Data?
    
    init(imageData: Data?) {
        self.imageData = imageData
    }
}
