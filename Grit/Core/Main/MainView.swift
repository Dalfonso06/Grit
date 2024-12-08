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
        if viewModel.userSession.user != nil, viewModel.userSession.isLoggedIn {
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

                
                ProfileView(viewModel: ProfileViewModel(updateLoginStatus: {
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
    let userSession = UserSession()
    userSession.user = DeveloperPreview().user
    
    return NavigationStack {
        MainView(viewModel: MainViewModel(userSession: userSession))
            .environmentObject(userSession)
    }
}
