//
//  ExerciseCellView.swift
//  Grit
//
//  Created by Daniel Alfonso on 5/21/24.
//

import SwiftUI

struct ExerciseCellView: View {
    
    @State var title: String = "Flat Barbell Bench"
    @State var author: String = "Daniel"
    @State var reps: [Int] = [8, 8, 8, 8]
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(author)
                        .font(.caption)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "dumbbell.fill")
                        .padding()
                        .background(Color.theme.neutral2)
                        .clipShape(RoundedRectangle(cornerRadius: DesignConstants.cornerRadius))
                }
                
                Spacer()
                
                Text("4 x 8-12")
                    .fontWeight(.heavy)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.vertical, 8)
    }
    
    
}

#Preview {
    List {
        ExerciseCellView()
        ExerciseCellView()
        ExerciseCellView()
    }
    .listStyle(.automatic)
    .navigationTitle("Exercises")
}
