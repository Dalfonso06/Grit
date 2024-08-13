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
        NavigationStack {
            MainView(viewModel: MainViewModel(container: viewModel.container))
        }
    }
}

class ContentViewModel: ObservableObject {
    
    @Published var container: DependencyContainer
    
    init(container: DependencyContainer) {
        self.container = container
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(container: DependencyContainer()))
}
