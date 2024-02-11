//
//  RoutineModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/11/24.
//

import Foundation

/*
 Routine Json:
 {
    "id": 5,
    "workouts": [
         {
            "id": 2,
            "name": "High volume chest workout"
            "description": "Killer chest workout",
            "exercises": [
                {
                    "id": 1,
                    "name": "Bench Press",
                    "description": "Free weight barbell workout.",
                    "sets": 4,
                    "reps": [4, 6, 12, 12]
                },
                {
                    "id": 12,
                    "name": "Incline Dumbell Press",
                    "description": "Incline dumbell bench press.",
                    "sets": 4,
                    "reps": [6, 6, 6, 6]
                }
            ]
         },
         { ... }
    ]
 */

struct Routine {
    let id: Int
    let workouts: [Workout]
}
