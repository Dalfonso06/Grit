//
//  ProfileHeaderView.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/25/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State var followers: Int
    @State var following: Int
    
    var body: some View {
        VStack {
            HStack {
                Image("GritPFP")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                
                Spacer()
                
                Text("Followers: \(followers)")
                    .padding()
                
                Text("Following: \(following)")
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

#Preview {
    ProfileHeaderView(followers: 456, following: 360)
}
