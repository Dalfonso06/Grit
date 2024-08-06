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
    
    func deleteUser() -> Void {
        Task {
            do {
                self.wasDeleted = try await self.authService.deleteUser()
            } catch {
                print("There was a problem deleting your user: \(error.localizedDescription)")
            }
        }
    }
}
