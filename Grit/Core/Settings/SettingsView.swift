//
//  SettingsView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/5/24.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel: SettingsViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: SettingsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            Button (action: {
                viewModel.signOut {
                    DispatchQueue.main.async {
                        dismiss()
                    }
                }
            }, label: {
                Text("Sign Out")
            })
            
            Button(action: {
                viewModel.deleteUser {
                    DispatchQueue.main.async {
                        dismiss()
                    }
                }
            }, label: {
                Text("Delete Account")
                    .foregroundStyle(Color.red)
            })
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(viewModel: SettingsViewModel(authService: AuthenticationService(), updateLoginStatus: {}))
    }
}
