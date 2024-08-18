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
    weak var mainViewModel: MainViewModel?
    
    @Published var authService: AuthenticationServiceProtocol
    @Published var userService: UserServiceProtocol
    var updateLoginStatus: () -> Void?
    
    init(
        authService: AuthenticationServiceProtocol,
        userService: UserServiceProtocol,
        mainViewModel: MainViewModel,
        updateLoginStatus: @escaping () -> Void
    ) {
        self.authService = authService
        self.userService = userService
        self.mainViewModel = mainViewModel
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
                let user = try await userService.getUserData(uid: uid)
                DispatchQueue.main.async {
                    self.mainViewModel?.user = user
                }
                print("Successful Login: \(user)")
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                print("Failed to Login: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.sync {
                self.isLoading.toggle()
                updateLoginStatus()
            }
        }
    }
}
