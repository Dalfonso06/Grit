//
//  WorkoutView.swift
//  Grit
//
//  Created by Daniel Alfonso on 4/29/24.
//

import SwiftUI

struct WorkoutView: View {
    
    @State private var exercises: [String] = ["Bench", "Incline Bench", "Chest Flys", "Dips"]
    @State private var addingExercise: Bool = false
    
    @State private var tempExercise: String = ""
    
    var body: some View {
        List {
            ForEach(exercises, id: \.self) { exercise in
                Text(exercise)
            }
            .onDelete(perform: { indexSet in
                exercises.remove(atOffsets: indexSet)
            })
            
            if (addingExercise) {
                TextField("Exercise", text: $tempExercise)
                    .onSubmit {
                        exercises.append(tempExercise)
                        tempExercise = ""
                        addingExercise = false
                    }
            }
            
            Button(action: {
                addingExercise.toggle()
                tempExercise = ""
            }, label: {
                Image(systemName: addingExercise ? "minus.circle.fill" : "plus.circle.fill")
                    .foregroundColor(Color.theme.main4)
                    .padding(.top)
                    .font(.title)
            })
            .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationTitle("Exercises")
    }
}

#Preview {
    NavigationView(content: {
        WorkoutView()
    })
    
}
