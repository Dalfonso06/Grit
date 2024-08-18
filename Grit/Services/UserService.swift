//
//  UserService.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/15/24.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

enum UserServiceError: Error {
  case imageDownloadFailed
}

class UserService: UserServiceProtocol {
    
    func getUserData(uid: String) async throws -> User {
        let db = Firestore.firestore()
        let documentRef = db.collection("Users").document(uid)
        let document = try await documentRef.getDocument()
        return User(uid: uid, document: document)
    }
    
    func getUserProfileImage(url: String) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            let storage = Storage.storage()
            let gsReference = storage.reference(forURL: url)
            
            gsReference.getData(maxSize: 1*1024*1024) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data {
                    continuation.resume(returning: data)
                } else {
                    continuation.resume(throwing: UserServiceError.imageDownloadFailed)
                }
            }
        }
    }
}
