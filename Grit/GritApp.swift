//
//  GritApp.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI

@main
struct GritApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(
                profileViewModel: ProfileViewModel(
                    firstname: "Daniel",
                    profilePicture: "GritPFP",
                    workouts: [Workout(id: 0, author: 0, name: " ", description: " ", tags: [" "], exercises: [])]
                )
            ))
        }
    }
}
