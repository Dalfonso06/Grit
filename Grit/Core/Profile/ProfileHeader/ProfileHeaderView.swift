//
//  ProfileHeaderView.swift
//  Grit
//
//  Created by Daniel Alfonso on 4/13/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @StateObject private var viewModel: ProfileHeaderViewModel
    
    init(viewModel: ProfileHeaderViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                ProfileImageView(viewModel: ProfileImageViewModel(imageData: viewModel.user.photoData))
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Hello \(viewModel.user.firstName ?? "No Name")")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    Text("Welcome")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                
                Spacer()
            }
            
            Button(action: {
                print("Pressed")
            }, label: {
                Image(systemName: "ellipsis")
                    .foregroundStyle(Color.gray)
                    .padding(5)
                    .font(.title)
            })
            
        }
        .frame(maxWidth: .infinity)
        .padding(DesignConstants.padding)
        .cornerRadius(DesignConstants.cornerRadius)
        .padding(DesignConstants.padding)
    }
}

#Preview {
    let user = DeveloperPreview().user
    
    return ZStack {
        ProfileHeaderView(viewModel: ProfileHeaderViewModel(userService: UserService(), user: user))
    }
}
