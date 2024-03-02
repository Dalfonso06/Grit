//
//  UserModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/22/24.
//

import Foundation

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

struct User: Identifiable, Codable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let followers: Int
    let following: Int
    let description: String?
    let profilePicture: String?
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id, username, email
        case followers, following, description
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePicture = "profile_picture"
        case createdAt = "created_at"
    }
}
