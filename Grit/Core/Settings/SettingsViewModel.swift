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
    var onLogout: () -> Void
    
    init(authService: AuthenticationServiceProtocol, onLogout: @escaping () -> Void) {
        self.authService = authService
        self.onLogout = onLogout
    }
    
    func signOut() -> Void {
        do {
            try self.authService.signOut()
            onLogout()
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
