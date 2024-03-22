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
                ProfileNavbarView(viewModel: ProfileNavBarViewModel(fullname: viewModel.fullname))
                    
                
                ScrollView {
                    ProfileHeaderView(
                        viewModel: viewModel.profileHeaderViewModel
                    )
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            viewModel: ProfileViewModel(
                fullname: dev.user.firstName + " " + dev.user.lastName,
                profileHeaderViewModel: ProfileheaderViewModel(
                    followers: dev.user.followers,
                    following: dev.user.following,
                    description: dev.user.description
                )
            )
        )
    }
}
