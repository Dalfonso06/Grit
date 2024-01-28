//
//  AlertColorView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/27/24.
//

import SwiftUI

struct AlertColorView: View {
    var body: some View {
        VStack {
            HStack {
                
                Button("Cancel") {
                }
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
                .background(
                    Color.theme.alert3
                        .cornerRadius(10)
                        .shadow(color: Color.theme.alert1, radius: 10, x: 0.0, y: 10)
                )
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Circle()
                        .foregroundColor(Color.theme.alert4)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10, x: 2, y: 2)
                        .overlay(
                            Image(systemName: "multiply")
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                        )
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Circle()
                        .foregroundColor(Color.theme.alert8)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10, x: 2, y: 2)
                        .overlay(
                            Image(systemName: "multiply")
                                .font(.largeTitle)
                                .foregroundColor(Color.theme.alert1)
                        )
                })

            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 175, height: 75)
                .foregroundColor(Color.theme.alert4)
                .shadow(color: Color.theme.alert5, radius: 5)
                .overlay {
                    Text("Failed to upload workout")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding()
            
        }
        .padding()
    }
}

@available(iOS 17, *) #Preview(traits: .sizeThatFitsLayout) {
    AlertColorView()
}
