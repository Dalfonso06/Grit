//
//  ProfileInfoView.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/12/24.
//

import SwiftUI

struct ProfileInfoView: View {
    
    @StateObject var viewModel: ProfileInfoViewModel
    @EnvironmentObject var userSession: UserSession
    
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
                    viewModel: UpdateProfileInfoViewModel(userSession: userSession)
                )
            }
            .foregroundStyle(.blue)
        }
        .navigationTitle("User Info")
    }
}

#Preview {
    let viewModel = ProfileInfoViewModel()
    
    let userSession = UserSession()
    userSession.user = DeveloperPreview().user
    userSession.isLoggedIn = true
    
    return NavigationStack {
        ProfileInfoView(viewModel: viewModel)
            .environmentObject(userSession)
    }
}
