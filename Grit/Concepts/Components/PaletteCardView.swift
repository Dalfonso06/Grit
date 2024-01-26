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
            Color.white
                .cornerRadius(5)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 10,
                    x: 0.0, y: 10)
        )
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

#Preview {
    PaletteCardView(title: "Title") {
        Text("View")
    }
}
