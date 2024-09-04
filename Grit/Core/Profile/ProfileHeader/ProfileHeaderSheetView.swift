//
//  ProfileHeaderSheetView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/31/24.
//

import SwiftUI

struct ProfileHeaderSheetView: View {
    
    @StateObject private var viewModel: ProfileHeaderSheetViewModel
    
    init(viewModel: ProfileHeaderSheetViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if let _ = viewModel.user.photoData, let uiImage = UIImage(data: viewModel.user.photoData!) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: DesignConstants.cornerRadius))
            }
            
            HStack {
                Text("\(viewModel.user.firstName!) \(viewModel.user.lastName!)")
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    let user = DeveloperPreview().user
    
    return ZStack {
        ProfileHeaderSheetView(viewModel: ProfileHeaderSheetViewModel(user: user))
    }
    .frame(width: 350)
    .padding()
    .background(Color.white)
    .clipShape(RoundedRectangle(cornerRadius: DesignConstants.cornerRadius))
    .shadow(radius: 20)
}
