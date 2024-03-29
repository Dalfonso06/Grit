//
//  ExerciseModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/11/24.
//

import Foundation

/*
 Exercise Json:
 {
     "id": 1,
     "name": "Bench Press",
     "muscle_group": "Chest",
     "description": "Free weight barbell workout.",
     "sets": 4,
     "reps": [4, 6, 12, 12]
 }
 */

struct Exercise: Identifiable, Codable {
    let id: Int
    let author: Int
    let name: String
    let muscleGroup: String
    let description: String
    let sets: Int8
    let reps: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id, author, name
        case muscleGroup = "muscle_group"
        case description, sets, reps
    }
}
