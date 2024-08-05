//
//  SettingsView.swift
//  Grit
//
//  Created by Daniel Alfonso on 8/5/24.
//

import SwiftUI

struct SettingsView: View {
    
    
    
    var body: some View {
        List {
            Button(action: {
                print("Pressed")
            }, label: {
                Text("Delete Account")
                    .foregroundStyle(Color.red)
            })
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
