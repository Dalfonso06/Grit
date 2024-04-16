//
//  ContentView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    
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

            ProfileView(viewModel: viewModel.profileViewModel)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(
            profileViewModel: ProfileViewModel(
                firstname: dev.user.firstName,
                profilePicture: dev.user.profilePicture ?? "",
                workouts: dev.workouts
            )
        ))
    }
}

class ContentViewModel: ObservableObject {
    
    @Published var profileViewModel: ProfileViewModel
    
    init(profileViewModel: ProfileViewModel) {
        self.profileViewModel = profileViewModel
    }
}
