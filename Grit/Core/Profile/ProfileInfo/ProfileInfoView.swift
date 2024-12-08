//
//  ProfileInfoView.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/12/24.
//

import SwiftUI

struct ProfileInfoView: View {
    
    @StateObject private var viewModel: ProfileInfoViewModel
    @EnvironmentObject var userSession: UserSession
    
    init (viewModel: ProfileInfoViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            Section {
                Text(userSession.user?.firstName ?? "")
                Text(userSession.user?.lastName ?? "")
                Text(userSession.user?.email ?? "No Email")
            } header: {
                Text("User")
            }
        }
        .listStyle(.inset)
        .toolbar {
            NavigationLink("Edit") {
                UpdateProfileInfoView(
                    viewModel: UpdateProfileInfoViewModel(
                        userService: viewModel.userService,
                        userSession: userSession
                    ))
            }
            .foregroundStyle(.blue)
        }
        .navigationTitle("User Info")
    }
}

#Preview {
    let user = DeveloperPreview().user
    let userService = UserService()
    let viewModel = ProfileInfoViewModel(userService: userService)
    
    let userSession = UserSession()
    userSession.user = DeveloperPreview().user
    userSession.isLoggedIn = true
    
    return NavigationStack {
        ProfileInfoView(viewModel: viewModel)
            .environmentObject(userSession)
    }
}
