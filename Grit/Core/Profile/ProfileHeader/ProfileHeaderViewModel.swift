//
//  ProfileHeaderViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/18/24.
//

import Foundation

final class ProfileHeaderViewModel: ObservableObject {
    
    @Published var imageData: Data?
    @Published var firstName: String
    @Published var userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol, firstName: String, imageData: Data?) {
        self.firstName = firstName
        self.imageData = imageData
        self.userService = userService
    }
    
//    func getProfileImage() -> Void {
//        Task {
//            do {
//                let data = try await userService.getUserProfileImage(url: self.profileUrl)
//                DispatchQueue.main.async {
//                    self.imageData = data
//                }
//            } catch {
//                print("Error downloading image: \(error.localizedDescription)")
//                DispatchQueue.main.async {
//                    self.imageData = nil
//                }
//            }
//        }
//    }
}
