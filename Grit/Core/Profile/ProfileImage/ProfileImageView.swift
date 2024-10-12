//
//  ProfileImageView.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/12/24.
//

import SwiftUI

struct ProfileImageView: View {
    
    @StateObject private var viewModel: ProfileImageViewModel
    
    init (viewModel: ProfileImageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
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
    }
}

#Preview {
    let userImage = DeveloperPreview().user.photoData
    
    return ProfileImageView(viewModel: ProfileImageViewModel(imageData: userImage))
}
