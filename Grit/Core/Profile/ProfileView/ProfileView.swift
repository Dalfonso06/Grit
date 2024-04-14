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
            VStack(spacing: 0) {
                
                ScrollView {
                    ProfileHeaderView(firstname: "Daniel", profilePicture: "GritPFP")
                        .padding()
                    
                    workoutList
                        .padding()
                }
                .navigationTitle("Profile Page")
            }
        }
    }
    
    var workoutList: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible(), spacing: 6, alignment: nil)], content: {
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            viewModel: ProfileViewModel(
                firstname: dev.user.firstName
            )
        )
    }
}
