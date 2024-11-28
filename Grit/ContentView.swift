//
//  ContentView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            MainView(viewModel: MainViewModel())
        }
    }
}

#Preview {
    ContentView()
}
