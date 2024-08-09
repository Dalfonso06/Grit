//
//  ForgotPasswordView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/6/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject private var viewModel: ForgotPasswordViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: ForgotPasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
            TextField("Confirm your email...", text: $viewModel.email)
                .padding(DesignConstants.padding)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(DesignConstants.cornerRadius)
                .autocapitalization(.none)
                .padding(.vertical, DesignConstants.padding)
            
            Button(action: {
                viewModel.resetPassword {
                    DispatchQueue.main.async {
                        dismiss()
                    }
                }
            }) {
                Text("Login")
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(DesignConstants.cornerRadius)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Confirm Email")
    }
}

#Preview {
    NavigationStack {
        ForgotPasswordView(viewModel: ForgotPasswordViewModel(authService: AuthenticationService()))
    }
}
