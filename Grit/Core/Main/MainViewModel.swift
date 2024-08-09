//
//  MainViewModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/7/24.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var container: DependencyContainer
    
    init(container: DependencyContainer) {
        self.container = container
    }
}
