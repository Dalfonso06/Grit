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
    "category": "Push",
    "exercises": [
        {
            "id": 1,
            "name": "Bench Press",
            "muscle_group": "Chest",
            "description": "Free weight barbell workout.",
            "sets": 4,
            "reps": [4, 6, 12, 12]
        },
        {
            "id": 12,
            "name": "Incline Dumbell Press",
            "muscle_group": "Upper Chest",
            "description": "Incline dumbell bench press.",
            "sets": 4,
            "reps": [6, 6, 6, 6]
        }
    ]
 }
 */

struct Workout {
    let id: Int
    let name: String
    let description: String
    let category: String
    let exercises: [Exercise]
}
