//
//  ContentView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        if (viewModel.isLoggedIn) {
            MainView(viewModel: MainViewModel(container: viewModel.container))
        } else {
            LoginView(viewModel: LoginViewModel(authService: viewModel.authService, onLoginSuccess: {
                viewModel.updateLoginStatus()
            }))
        }
    }
}

class ContentViewModel: ObservableObject {
    
    @Published var container: DependencyContainer
    @Published var isLoggedIn: Bool = false
    
    var authService: AuthenticationServiceProtocol {
        container.authService
    }
    
    init(container: DependencyContainer) {
        self.container = container
    }
    
    func updateLoginStatus() -> Void {
        self.isLoggedIn = authService.isLoggedIn()
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(container: DependencyContainer()))
}
