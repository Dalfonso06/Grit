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
                
                if let _ = viewModel.imageData, let uiImage = UIImage(data: viewModel.imageData!) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: DesignConstants.cornerRadius))
                } else {
                    Image(uiImage: UIImage(named: "DefaultPFP")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: DesignConstants.cornerRadius))
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
    }
}

#Preview {
    let user = DeveloperPreview().user
    
    return ZStack {
        ProfileHeaderView(viewModel: ProfileHeaderViewModel(userService: UserService(), firstName: user.firstName!, imageData: user.photoData))
    }
}
