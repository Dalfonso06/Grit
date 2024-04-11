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
                    header
                        .padding()
                }
                .navigationTitle("Profile Page")
            }
        }
    }
    
    var header: some View {
        VStack {
            HStack {
                Image("GritPFP")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 30)
                    )
                    .padding(.trailing, 20)
                
                
                
                VStack(alignment: .leading) {
                    Text("Hello \(viewModel.firstname)")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    Text("Welcome")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .padding(.leading, 20)
            }
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
