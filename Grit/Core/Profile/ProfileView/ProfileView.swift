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
                    firstname: viewModel.firstname,
                    profilePicture: viewModel.profilePicture
                )
                .frame(width: .infinity)
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
                        SettingsView(viewModel: SettingsViewModel(authService: viewModel.container.authService))
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            viewModel: ProfileViewModel(container: DependencyContainer())
        )
    }
}
