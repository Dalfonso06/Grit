//
//  UserModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/22/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// User Profile Json:
// {
//   "id": 123,
//   "username": "john_doe",
//   "email": "john.doe@example.com",
//   "first_name": "John",
//   "last_name": "Doe",
//   "birth_date":  "2000-05-06T00:00:00",
//   "followers": 54,
//   "following": 27,
//   "profile_picture": "https://example.com/user/123/avatar.jpg",
//   "created_at": "2023-11-23T08:12:00Z"
// }

struct User {
    let uid: String
    let email: String?
    let photoUrl: String?
    let firstName: String?
    let lastName: String?
    let followers: Int?
    let following: Int?
    
    init(uid: String, document: DocumentSnapshot) {
        self.uid = uid
        self.email = document.get("email") as? String
        self.photoUrl = document.get("profilePictureUrl") as? String
        self.firstName = document.get("firstName") as? String
        self.lastName = document.get("lastName") as? String
        self.followers = document.get("followers") as? Int
        self.following = document.get("following") as? Int
    }
}
