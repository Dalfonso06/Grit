//
//  WorkoutView.swift
//  Grit
//
//  Created by Daniel Alfonso on 4/29/24.
//

import SwiftUI

struct WorkoutView: View {
    
    var exercises: [String] = ["Bench", "Incline Bench", "Chest Flys", "Dips"]
    
    var body: some View {
        List {
            Section(header:
                Text("Exercises")
            ) {
                ForEach(exercises, id: \.self) { exercise in
                    Text(exercise)
                }
            }
            
            
            Image(systemName: "plus.circle.fill")
                .foregroundColor(Color.theme.main4)
                .padding(.top)
                .font(.title)
                .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    WorkoutView()
}
