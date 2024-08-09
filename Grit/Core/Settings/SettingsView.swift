//
//  SettingsView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/5/24.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            Button (action: viewModel.signOut, label: {
                Text("Sign Out")
            })
            
            Button(action: viewModel.deleteUser, label: {
                Text("Delete Account")
                    .foregroundStyle(Color.red)
            })
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(viewModel: SettingsViewModel(authService: AuthenticationService(), onLogout: {
            print("Logged out")
        }))
    }
}
