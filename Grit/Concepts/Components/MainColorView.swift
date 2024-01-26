//
//  MainColorView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/25/24.
//

import SwiftUI

struct MainColorView: View {
    var body: some View {
        VStack {
            HStack {
                Button("Primary") {
                }
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
                .background(
                    Color.theme.main5
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 0.0, y: 10)
                )
                
                Spacer()
                
                Button(action: {}, label: {
                    Circle()
                        .fill(Color.theme.main1)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10, x: 0.0, y: 10)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(Color.theme.main6)
                        )
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Circle()
                        .fill(Color.theme.main9)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10, x: 0.0, y: 10)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(Color.theme.main1)
                        )
                })
            }
            .padding(.vertical)
            
            VStack(alignment: .leading) {
                Text("Updated")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
                    .foregroundColor(Color.theme.main8)
                
                Text("You have successfully updated your workout in your routine, check your profile to see your new changes.")
                    .foregroundColor(Color.theme.main7)
                    .padding(.top, 5)
                    .padding(.horizontal)
            }
            .padding(.vertical)
            .background(Color.theme.main1)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 0.5)
                    .foregroundColor(Color.theme.main6)
            )
            .shadow(radius: 5, x: 0.0, y: 3)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<20) { index in
                        VStack(alignment: .leading) {
                            Text("New Workouts")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading)
                            
                            Text("Tap to discover brand new workouts to add to your routines")
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.horizontal)
                        }
                        .padding(.vertical)
                        .frame(width: 175, height: .infinity, alignment: .topLeading)
                        .background(Color.theme.main4)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.trailing)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

@available(iOS 17, *) #Preview(traits: .sizeThatFitsLayout) {
    MainColorView()
        .padding()
}
