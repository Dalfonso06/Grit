//
//  LoginView.swift
//  Grit
//
//  Created by Daniel Alfonso on 7/30/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding(DesignConstants.padding)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(DesignConstants.cornerRadius)
                .autocapitalization(.none)

            SecureField("Password", text: $viewModel.password)
                .padding(DesignConstants.padding)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(DesignConstants.cornerRadius)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            NavigationLink(destination: ForgotPasswordView(viewModel: ForgotPasswordViewModel(authService: viewModel.authService))) {
                Text("Forgot Password?")
                    .font(.callout)
                    .foregroundColor(.blue)
                    .padding(.top, DesignConstants.padding)
            }
            
            NavigationLink(destination: SignUpView(viewModel: SignUpViewModel(authService: viewModel.authService))) {
                Text("Don't have an account? Sign Up")
                    .font(.callout)
                    .foregroundColor(.blue)
                    .padding(.vertical, DesignConstants.padding)
            }

            Button(action: {
                viewModel.signIn()
            }) {
                Text("Login")
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(DesignConstants.cornerRadius)
            }
            .disabled(viewModel.isLoading)
            
            if (viewModel.isLoading) {
                ProgressView()
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Login Page")
    }
}

#Preview {
    let userSession = UserSession()
    userSession.user = DeveloperPreview().user
    
    return NavigationStack() {
        LoginView(viewModel: LoginViewModel(
            mainViewModel: MainViewModel(userSession: userSession),
            updateLoginStatus: {
                print("Preview")
        }))
    }
}
