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
        VStack {
            HStack {
                
                if let imageData = viewModel.imageData, let uiImage = UIImage(data: viewModel.imageData!) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: DesignConstants.cornerRadius))
                } else {
                    ProgressView()
                        .frame(width: 120, height: 120)
                }
                
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Hello \(viewModel.firstName)")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    Text("Welcome")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(DesignConstants.padding)
        .background()
        .cornerRadius(DesignConstants.cornerRadius)
        .padding(DesignConstants.padding)
        .onAppear {
            viewModel.getProfileImage()
        }
    }
}

#Preview {
    let user = DeveloperPreview().user
    
    return ZStack {
        Color("BackgroundColor")
            .ignoresSafeArea()
        
        ProfileHeaderView(viewModel: ProfileHeaderViewModel(userService: UserService(), firstName: user.firstName!, profileUrl: user.photoUrl!))
    }
}
