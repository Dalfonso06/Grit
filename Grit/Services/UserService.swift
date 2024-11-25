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
        let photoData = try await self.getUserProfileImage(url: document.get("profilePictureUrl") as! String)
        return User(uid: uid, document: document, photoData: photoData)
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
    
    func updateUser(user: User) async throws -> Void {
        let db = Firestore.firestore()
        let documentRef = db.collection("Users").document(user.uid)
        
        let snapshot = try await documentRef.getDocument()
        guard let existingData = snapshot.data() else {
            throw NSError(domain: "UserDocumentError", code: 404, userInfo: [NSLocalizedDescriptionKey: "User document not found"])
        }
        
        let userData: [String: Any] = [
            "uid": user.uid,
            "email": user.email ?? "",
            "firstName": user.firstName ?? "",
            "lastName": user.lastName ?? "",
            "followers": user.followers ?? -1,
            "following": user.following ?? -1,
            "profilePictureUrl": user.photoUrl ?? "",
            "weight": existingData["weight"] ?? -1,
            "birthDate": existingData["birthDate"] ?? Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1))!
        ]
        
        try await documentRef.updateData(userData)
    }
}
