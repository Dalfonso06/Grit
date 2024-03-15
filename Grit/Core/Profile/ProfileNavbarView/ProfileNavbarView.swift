//
//  ProfileNavbarView.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/23/24.
//

import SwiftUI

struct ProfileNavbarView: View {
    
    @StateObject var viewModel: ProfileNavBarViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.fullname)
                .font(.title2)
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "gear")
                    .font(.title2)
                    .padding(.horizontal)
            })
        }
        .padding(.vertical)
    }
}

struct ProfileNavbarView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNavbarView(
            viewModel: ProfileNavBarViewModel(
                fullname: dev.user.firstName + " " + dev.user.lastName
            )
        )
    }
}
