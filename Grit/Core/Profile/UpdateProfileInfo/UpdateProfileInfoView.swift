//
//  UpdateProfileInfoView.swift
//  Grit
//
//  Created by Daniel Alfonso on 10/16/24.
//

import SwiftUI

struct UpdateProfileInfoView: View {
    
    @StateObject private var viewModel: UpdateProfileInfoViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var showError: Bool = false
    @State var errorMessage: String = "Test error"
    
    init (viewModel: UpdateProfileInfoViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Form {
            Section {
                // Plain style is added because of a didSet bug
                TextField("First name", text: $viewModel.firstName)
                    .textFieldStyle(.plain)
                TextField("Last name", text: $viewModel.lastName)
                    .textFieldStyle(.plain)
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.plain)
            }
        }
        .navigationTitle("Update Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if (viewModel.hasChanges) {
                    Button("Save") {
    //                    viewModel.saveChanges {
    //                        // Dismiss the view on successful save
    //                        presentationMode.wrappedValue.dismiss()
    //                    }
                    }
                    .foregroundColor(.blue)
                }
            }
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    let user = DeveloperPreview().user
    let userService = UserService()
    let viewModel = UpdateProfileInfoViewModel(user: user, userService: userService)
    
    return NavigationStack {
        UpdateProfileInfoView(viewModel: viewModel)
    }
}
