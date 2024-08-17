//
//  UserService.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/15/24.
//

import Foundation
import FirebaseFirestore

class UserService: UserServiceProtocol {
    
    func getUserData(uid: String) async throws -> User {
        let db = Firestore.firestore()
        let documentRef = db.collection("Users").document(uid)
        let document = try await documentRef.getDocument()
        return User(uid: uid, document: document)
    }
}
