//
//  ForgotPasswordViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/6/24.
//

import Foundation

final class ForgotPasswordViewModel: ObservableObject {
    
    @Published var email: String = ""
    
    private let authService: AuthenticationServiceProtocol
    
    init(authService: AuthenticationServiceProtocol) {
        self.authService = authService
    }
    
    func resetPassword() {
        Task {
            do {
                try await self.authService.resetPassword(email: self.email)
            } catch {
                print("There was an error sending reset password link: \(error.localizedDescription)")
            }
        }
    }
}
