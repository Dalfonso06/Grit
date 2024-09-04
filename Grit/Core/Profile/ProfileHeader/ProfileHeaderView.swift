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
                if let _ = viewModel.user.photoData, let uiImage = UIImage(data: viewModel.user.photoData!) {
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
