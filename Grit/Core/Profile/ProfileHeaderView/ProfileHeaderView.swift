//
//  ProfileHeaderView.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/25/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @StateObject var viewModel: ProfileheaderViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image("GritPFP")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                
                Spacer()
                
                Text("Followers: \(viewModel.followers)")
                    .padding()
                
                Text("Following: \(viewModel.following)")
                    .padding()
            }
            
            HStack {
                Text("Comfort is the enemy of progress. \nEmbrace the challenge and unlock your hidden potential. \n#EmbraceTheGrind #LevelUp")
                    .font(.subheadline)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(viewModel: ProfileheaderViewModel(followers: dev.user.followers, following: dev.user.following))
    }
}
