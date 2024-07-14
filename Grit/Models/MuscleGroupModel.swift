//
//  MuscleGroupModel.swift
//  Grit
//
//  Created by Daniel Alfonso on 4/14/24.
//

import Foundation

/*
 Muscle Group Json:
 {
    "id": 1,
    "name": "chest"
 }
 */

class MuscleGroupModel: Identifiable, Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
