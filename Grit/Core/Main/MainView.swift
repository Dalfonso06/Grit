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

            ProfileView(viewModel: ProfileViewModel(container: viewModel.container))
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel(container: DependencyContainer()))
}
