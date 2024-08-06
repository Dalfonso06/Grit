//
//  ForgotPasswordView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/6/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject private var viewModel: ForgotPasswordViewModel
    
    init(viewModel: ForgotPasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ForgotPasswordView(viewModel: ForgotPasswordViewModel())
}
