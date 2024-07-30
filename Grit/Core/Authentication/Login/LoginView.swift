//
//  LoginView.swift
//  Grit
//
//  Created by Daniel Alfonso on 7/30/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
            VStack {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

//                if let errorMessage = viewModel.errorMessage {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                        .padding()
//                }

//                if viewModel.isLoading {
//                    ProgressView()
//                        .padding()
//                }

                Button(action: {
                    viewModel.signIn()
                }) {
                    Text("Login")
                        .padding()
                        .frame(width: .infinity, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(DesignConstants.cornerRadius)
                }
//                .disabled(viewModel.isLoading)
            }
            .padding()
        }
}

#Preview {
    LoginView()
}
