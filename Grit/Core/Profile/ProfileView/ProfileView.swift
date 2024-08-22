//
//  ProfileView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ProfileHeaderView(
                    viewModel: ProfileHeaderViewModel(userService: viewModel.userService, firstName: viewModel.user.firstName ?? "Name Error", profileUrl: viewModel.user.photoUrl ?? "")
                )
                .padding(.vertical)
                
                workoutList
                    .padding(.vertical, 20)
                
            }
//            .background(Color("BackgroundColor"))
            .navigationTitle("Profile Page")
            .toolbar(content: {
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: {
                        SettingsView(viewModel: SettingsViewModel(authService: viewModel.container.authService, updateLoginStatus: {
                            viewModel.updateLoginStatus()
                        }))
                    }, label: {
                        Image(systemName: "gear")
                    })
                }
            })
        }
    }
    
    var workoutList: some View {
        VStack(alignment: .leading) {
            
            Text("Workouts")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(viewModel.workouts) { workout in
                        WorkoutCardView(
                            workoutName: workout.name,
                            firstname: "Daniel",
                            tags: workout.tags,
                            description: workout.description
                        )
                        .scrollTargetLayout()
                        .padding()
                    }
                }
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    let container = DependencyContainer()
    let user = DeveloperPreview().user
    
    return NavigationStack {
        ProfileView(viewModel: ProfileViewModel(container: container, user: user, updateLoginStatus: {
            print("Action")
        }))
    }
}
