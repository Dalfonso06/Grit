//
//  CardView.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/25/24.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .overlay(
                Rectangle()
                    .stroke(.gray, lineWidth: 1)
                    .frame(width: nil, height: 1) // Set height to 1 for bottom line
                    .offset(y: 20)
            )
    }
}

#Preview {
    CardView() {
        Text("Hello, World!")
    }
}
