//
//  SignUpViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/1/24.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordRepeat: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    // TODO: Utilize dependency injection
    private let authService = AuthenticationService()
    
    private func passwordsConfirmed() -> Bool {
        return password == passwordRepeat
    }
    
    private func validForm() -> Bool {
        return !email.isEmpty && !password.isEmpty && !passwordRepeat.isEmpty
    }
    
    func createUser() -> Void {
        guard validForm() else {
            self.errorMessage = "Please input empty fields"
            return
        }
        
        guard passwordsConfirmed() else {
            self.errorMessage = "Passwords don't match"
            return
        }
        
        self.isLoading.toggle()
        self.errorMessage = nil
        
        Task {
            do {
                let user = try await authService.signIn(email: self.email, password: self.password)
                print("Successful Login: \(user)")
            } catch {
                self.errorMessage = error.localizedDescription
                print("Failed to Login: \(error.localizedDescription)")
            }
        }
        
        self.isLoading.toggle()
    }
}
