//
//  WorkoutModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/11/24.
//

import Foundation

/*
 Workout Json:
 {
    "id": 2,
    "name": "High volume chest workout"
    "description": "Killer chest workout",
    "tags": ["Push", "Chest", "Triceps"]
    "exercises": [
        {
            "id": 1,
            "name": "Bench Press",
            "muscle_group": "Chest",
            "description": "Free weight barbell workout.",
            "reps": [4, 6, 12, 12]
        },
        {
            "id": 12,
            "name": "Incline Dumbell Press",
            "muscle_group": "Upper Chest",
            "description": "Incline dumbell bench press.",
            "reps": [6, 6, 6, 6]
        }
    ]
 }
 */

struct Workout: Identifiable, Codable {
    let id: Int
    let author: Int
    let name: String
    let description: String
    let tags: [String]
    let exercises: [Exercise]
    
    enum CodingKeys: String, CodingKey {
        case id, author, name, description
        case tags, exercises
    }
}
