//
//  MainView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/7/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        if userSession.user != nil, userSession.isLoggedIn {
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
