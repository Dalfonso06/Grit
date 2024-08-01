//
//  UserModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/22/24.
//

import Foundation
import FirebaseAuth

// User Profile Json:
// {
//   "id": 123,
//   "username": "john_doe",
//   "email": "john.doe@example.com",
//   "first_name": "John",
//   "last_name": "Doe",
//   "followers": 54,
//   "following": 27,
//   "profile_picture": "https://example.com/user/123/avatar.jpg",
//   "created_at": "2023-11-23T08:12:00Z"
// }

struct User {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: FirebaseAuth.User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}
