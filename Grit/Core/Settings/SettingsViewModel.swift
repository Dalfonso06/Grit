//
//  SettingsViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/5/24.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    private var wasDeleted: Bool = false
    private let authService: AuthenticationServiceProtocol
    var updateLoginStatus: () -> Void
    
    init(authService: AuthenticationServiceProtocol, updateLoginStatus: @escaping () -> Void) {
        self.authService = authService
        self.updateLoginStatus = updateLoginStatus
    }
    
    func signOut(completion: @escaping () -> Void) -> Void {
        do {
            try self.authService.signOut()
            print("Successfully logged out.")
            completion()
        } catch {
            print("There was an error logging out: \(error.localizedDescription)")
        }
        updateLoginStatus()
    }
    
    func deleteUser(completion: @escaping () -> Void) -> Void {
        Task {
            do {
                self.wasDeleted = try await self.authService.deleteUser()
                print("Successfully deleted.")
                completion()
            } catch {
                print("There was a problem deleting your user: \(error.localizedDescription)")
            }
            updateLoginStatus()
        }
    }
}
