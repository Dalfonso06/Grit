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
    
    init(authService: AuthenticationServiceProtocol) {
        self.authService = authService
    }
    
    func signOut() -> Void {
        do {
            try self.authService.signOut()
            print("Successfully logged out.")
        } catch {
            print("There was an error logging out: \(error.localizedDescription)")
        }
    }
    
    func deleteUser() -> Void {
        Task {
            do {
                self.wasDeleted = try await self.authService.deleteUser()
                print("Successfully deleted.")
            } catch {
                print("There was a problem deleting your user: \(error.localizedDescription)")
            }
        }
    }
}
