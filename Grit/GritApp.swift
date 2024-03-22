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
                    fullname: "Daniel Alfonso",
                    profileHeaderViewModel: ProfileheaderViewModel(
                        followers: 345,
                        following: 234,
                        description: "What goes around comes around."
                    )
                )
            ))
        }
    }
}
