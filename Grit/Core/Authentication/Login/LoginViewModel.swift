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
    
    @Published var authService: AuthenticationServiceProtocol
    @Published var userService: UserServiceProtocol
    var updateLoginStatus: () -> Void?
    
    init(
        authService: AuthenticationServiceProtocol,
        userService: UserServiceProtocol,
        updateLoginStatus: @escaping () -> Void
    ) {
        self.authService = authService
        self.userService = userService
        self.updateLoginStatus = updateLoginStatus
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
                let uid = try await authService.signIn(email: self.email, password: self.password)
                self.user = try await userService.getUserData(uid: uid)
                print("Successful Login: \(String(describing: user))")
            } catch {
                self.errorMessage = error.localizedDescription
                print("Failed to Login: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.sync {
                self.isLoading.toggle()
                updateLoginStatus()
            }
        }
    }
}
