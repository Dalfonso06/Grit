//
//  UserServiceProtocol.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/15/24.
//

import Foundation
import Firebase

protocol UserServiceProtocol {
    func getUserData(uid: String) async throws -> User
    func getUserProfileImage(url: String) async throws -> Data
}
