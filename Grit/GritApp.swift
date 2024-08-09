//
//  GritApp.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate : NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct GritApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let container = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(container: container))
        }
    }
}
