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
            .navigationTitle("Profile Page")
        }
        .background(Color.blue)
    }
    
    var workoutList: some View {
        VStack(alignment: .leading) {
            
            Text("Workouts")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(0..<3) { index in
                        WorkoutCardView(
                            workoutName: "Test",
                            firstname: "Daniel",
                            tags: ["Test", "Chest", "Abs"],
                            description: "This is a test workout"
                        )
                        .padding()
                        .scrollTargetLayout()
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
            viewModel: ProfileViewModel(
                firstname: dev.user.firstName,
                profilePicture: dev.user.profilePicture ?? ""
            )
        )
    }
}
