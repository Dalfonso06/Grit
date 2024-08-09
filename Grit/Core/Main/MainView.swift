//
//  MainView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/7/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        if (!viewModel.isLoggedIn) {
            LoginView(viewModel: LoginViewModel(authService: viewModel.authService, updateLoginStatus: {
                viewModel.updateLoginStatus()
            }))
        } else {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }

                ActionView()
                    .tabItem {
                        Image(systemName: "globe")
                        Text("Action")
                    }

                ProfileView(viewModel: ProfileViewModel(container: viewModel.container, updateLoginStatus: {
                    viewModel.updateLoginStatus()
                }))
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView(viewModel: MainViewModel(container: DependencyContainer()))
    }
}
