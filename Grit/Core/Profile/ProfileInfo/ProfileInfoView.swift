//
//  ProfileInfoView.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/12/24.
//

import SwiftUI

struct ProfileInfoView: View {
    
    @StateObject private var viewModel: ProfileInfoViewModel
    
    init (viewModel: ProfileInfoViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            Section {
                Text(viewModel.user.firstName ?? "")
                Text(viewModel.user.lastName ?? "")
                Text(viewModel.user.email ?? "No Email")
            } header: {
                Text("User")
            }
        }
        .listStyle(.inset)
        .toolbar{
            Button("Edit") {
                print("Pressed")
            }
            .foregroundColor(.blue)
        }
        .navigationTitle("User Info")
    }
}

#Preview {
    let user = DeveloperPreview().user
    let userService = UserService()
    let viewModel = ProfileInfoViewModel(userService: userService, user: user)
    
    return NavigationStack {
        ProfileInfoView(viewModel: viewModel)
    }
}
