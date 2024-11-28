//
//  SettingsViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/5/24.
//

import Foundation
import Dependency

final class SettingsViewModel: ObservableObject {
    
    private var wasDeleted: Bool = false
    
    @Dependency(\.authService) var authService: AuthenticationServiceProtocol
    var updateLoginStatus: () -> Void
    
    init(updateLoginStatus: @escaping () -> Void) {
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
