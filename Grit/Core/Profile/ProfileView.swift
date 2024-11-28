//
//  ProfileView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI
import Dependency

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        ScrollView {
            ProfileHeaderView(
                viewModel: ProfileHeaderViewModel(
                    userService: viewModel.userService,
                    user: viewModel.user
                )
            )
            .padding(.vertical)
            
        }
        .navigationTitle("Profile Page")
        .toolbar(content: {
            HStack {
                Spacer()
                
                NavigationLink(destination: {
                    SettingsView(viewModel: SettingsViewModel(updateLoginStatus: {
                        viewModel.updateLoginStatus()
                    }))
                }, label: {
                    Image(systemName: "gear")
                })
            }
        })
    }
}

#Preview {
    let user = DeveloperPreview().user
    
    return NavigationStack {
        ProfileView(viewModel: ProfileViewModel(user: user, updateLoginStatus: {
            print("Action")
        }))
    }
}
