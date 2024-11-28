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
        if let user = viewModel.user, viewModel.isLoggedIn {
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

                
                ProfileView(viewModel: ProfileViewModel(user: user, updateLoginStatus: {
                    viewModel.updateLoginStatus()
                }))
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }
        } else {
            LoginView(viewModel: LoginViewModel(mainViewModel: viewModel, updateLoginStatus: {
                viewModel.updateLoginStatus()
            }))
        }
    }
}

#Preview {
    NavigationStack {
        MainView(viewModel: MainViewModel())
    }
}
