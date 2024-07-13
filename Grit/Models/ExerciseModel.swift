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
   "Id": 1,
   "Author": "Daniel Alfonso"
   "Name": "Bench Press",
   "MuscleGroup": "Chest",
   "Description": "A compound exercise that targets the chest, shoulders, and triceps.",
   "Reps": [
     {
       "MinReps": 8,
       "MaxReps": 12
     },
     {
       "MinReps": 8,
       "MaxReps": 12
     },
     {
       "MinReps": 8,
       "MaxReps": 12
     }
   ]
 }
 */

struct Exercise: Identifiable, Codable {
    let id: Int
    let author: Int
    let name: String
    let muscleGroup: MuscleGroupModel?
    let description: String
    let reps: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id, author, name
        case muscleGroup = "muscle_group"
        case description, reps
    }
}
