//
//  DeveloperProvider.swift
//  Grit
//
//  Created by Daniel Alfonso on 3/2/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let user = User(
        id: 0,
        username: "Dalfonso00",
        email: "danielalfonso06@gmail.com",
        firstName: "Daniel",
        lastName: "Alfonso",
        followers: 300,
        following: 250,
        description: "What people get wrong about motivation is that they think it's a permanent solution.",
        profilePicture: "GritPFP",
        createdAt: Date()
    )
    
    let workouts = [
        Workout(
            id: 1,
            author: 0,
            name: "Chest",
            description: "This brutal chest workout is designed to maximize muscle growth and leave you feeling the burn. It combines classic exercises like barbell bench press with targeted movements like incline dumbbell press and decline flyes to hit your entire chest from top to bottom. Weighted dips and cable flyes add a finishing touch for a well-rounded and pump-inducing routine.",
            tags: ["Chest", "HIIT", "Tricep"],
            exercises: []
        ),
        Workout(
            id: 2,
            author: 0,
            name: "Legs (Quad Focussed)",
            description: "This intense leg workout will challenge your quads, hamstrings, and calves, leaving you feeling the burn and ready for growth. It combines compound exercises like squats and deadlifts with targeted movements like leg press and hamstring curls to sculpt and strengthen your entire lower body.",
            tags: ["Legs", "Lower Body", "Strength"],
            exercises: []
        ),
        Workout(
            id: 3,
            author: 0,
            name: "Back",
            description: "Get ready to build a strong and defined back with this killer workout. It focuses on hitting all the major back muscles, including lats, traps, and rhomboids. Prepare to feel the burn as you perform a variety of exercises that will challenge your pulling strength and build serious back mass.",
            tags: ["Back", "Posterior Chain", "Strength"],
            exercises: []
        )
    ]
    
}
