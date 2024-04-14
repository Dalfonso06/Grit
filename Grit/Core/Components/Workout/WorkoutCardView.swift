//
//  WorkoutCardView.swift
//  Grit
//
//  Created by Daniel Alfonso on 4/13/24.
//

import SwiftUI

struct WorkoutCardView: View {
    
    @State var workoutName: String
    @State var firstname: String
    @State var tags: [String]
    @State var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                Color.theme.neutral1
                
                VStack(alignment: .leading) {
                    Text(workoutName)
                        .foregroundColor(Color.theme.neutral7)
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text(firstname)
                        .font(.caption)
                        .foregroundColor(Color.theme.neutral4)
                        .fontWeight(.semibold)
                }
                .padding(.leading)
            }
            .padding(.bottom)
            .frame(height: 90)
            
            Spacer()
            
            Text(description)
                .padding(.horizontal)
                .font(.caption)
            
            Spacer()
            
            HStack {
                ForEach(tags.prefix(3), id: \.self) { tag in
                    TagView(name: tag)
                }
                if (tags.count > 3) {
                    TagView(name: "...")
                }
            }
            .padding()
        }
        .frame(width: 300, height: 200)
        .background()
        .cornerRadius(25)
        .shadow(radius: 7, y: 2)
    }
}

#Preview {
    WorkoutCardView(
        workoutName: "Chest",
        firstname: "Daniel",
        tags: ["Chest", "Push", "Tricep", "Abs"],
        description: "Explosive chest workout that targets mid and upper chest heavily. Finishing off with an intense tricep superset giving you the most contraction."
    )
}
