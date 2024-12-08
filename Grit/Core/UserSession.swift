//
//  Untitled.swift
//  Grit
//
//  Created by Daniel Alfonso on 12/1/24.
//

import Foundation

final class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var user: User?
}
