//
//  ContentView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var userSession = UserSession()

    var body: some View {
        NavigationStack {
            MainView(viewModel: MainViewModel(userSession: userSession))
        }
        .environmentObject(userSession)
    }
}

#Preview {
    ContentView()
}
