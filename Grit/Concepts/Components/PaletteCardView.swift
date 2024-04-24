//
//  PaletteCardView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/25/24.
//

import SwiftUI

struct PaletteCardView<Content: View>: View {
    
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("\(title)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    
                    content
                }
            }
            .padding()
            .padding(.vertical, 10)
            .background(
                Color("BackgroundColor")
                    .cornerRadius(25)
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
            )
            .padding(.horizontal, 20)
        .padding(.top, 10)
        }
    }
}

#Preview {
    PaletteCardView(title: "Title") {
        Text("This is an example view to show off the text and background color of the new shadings.")
    }
}
