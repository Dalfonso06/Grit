//
//  ForgotPasswordViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/6/24.
//

import Foundation

final class ForgotPasswordViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var isLoading: Bool = false
    
    private let authService: AuthenticationServiceProtocol
    
    init(authService: AuthenticationServiceProtocol) {
        self.authService = authService
    }
    
    func resetPassword(completion: @escaping () -> Void) {
        
        self.isLoading.toggle()
        
        Task {
            do {
                try await self.authService.resetPassword(email: self.email)
                completion()
            } catch {
                print("There was an error sending reset password link: \(error.localizedDescription)")
            }
            self.isLoading.toggle()
        }
    }
}
