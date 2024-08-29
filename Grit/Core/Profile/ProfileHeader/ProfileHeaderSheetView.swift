//
//  ProfileHeaderSheet.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/29/24.
//

import SwiftUI

struct ProfileHeaderSheetView: View {
    
    @StateObject private var viewModel: ProfileHeaderSheetViewModel
    
    init(viewModel: ProfileHeaderSheetViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let user = DeveloperPreview().user
    let container = DependencyContainer()
    
    return ProfileHeaderSheetView(viewModel: ProfileHeaderSheetViewModel(user: user, userService: container.userService))
}
