//
//  SignUpView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/1/24.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = SignUpViewModel()
    
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
            
            SecureField("Re-type Password", text: $viewModel.passwordRepeat)
                .padding(DesignConstants.padding)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(DesignConstants.cornerRadius)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
            
            Button(action: {
                dismiss()
            }) {
                Text("Already have an account?")
                    .font(.callout)
                    .foregroundStyle(Color.blue)
                    .padding(.vertical, DesignConstants.padding)
            }


            Button(action: {
                viewModel.createUser()
            }) {
                Text("Sign Up")
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(DesignConstants.cornerRadius)
            }
            .disabled(viewModel.isLoading)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
