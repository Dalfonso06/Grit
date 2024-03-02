//
//  ProfileView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State var fullname: String
    @State var followers: Int
    @State var following: Int
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ProfileNavbarView(fullname: fullname)
                    
                
                ScrollView {
                    ProfileHeaderView(followers: followers, following: following)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(fullname: "Daniel Alfonso", followers: 345, following: 320)
    }
}
