//
//  DeveloperProvider.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/2/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let user = User(
        id: 0,
        username: "Dalfonso00",
        email: "danielalfonso06@gmail.com", 
        firstName: "Daniel",
        lastName: "Alfonso",
        followers: 300,
        following: 250,
        description: nil,
        profilePicture: nil,
        createdAt: Date()
    )
    
}
