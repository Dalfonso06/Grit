//
//  LoginViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 7/30/24.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var user: User?
    
    private let authService: AuthenticationServiceProtocol
    var onLoginSuccess: () -> Void?
    
    init(authService: AuthenticationServiceProtocol, onLoginSuccess: @escaping () -> Void) {
        self.authService = authService
        self.onLoginSuccess = onLoginSuccess
    }
    
    private func validForm() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    func signIn() -> Void {
        guard validForm() else {
            self.errorMessage = "Please input empty fields."
            return
        }
        
        self.isLoading.toggle()
        self.errorMessage = nil
        
        Task {
            do {
                let user = try await authService.signIn(email: self.email, password: self.password)
                onLoginSuccess()
                print("Successful Login: \(user)")
            } catch {
                self.errorMessage = error.localizedDescription
                print("Failed to Login: \(error.localizedDescription)")
            }
        }
        
        self.isLoading.toggle()
    }
}
