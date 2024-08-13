//
//  TagView.swift
//  Grit
//
//  Created by Daniel Alfonso on 4/14/24.
//

import SwiftUI

struct TagView: View {
    
    @State var name: String
    
    var body: some View {
        Text(name)
            .font(.caption)
            .foregroundStyle(Color.theme.neutral4)
            .frame(minWidth: 20)
            .lineLimit(1)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(Color.theme.neutral1)
            .cornerRadius(100)
    }
}

#Preview {
    VStack(spacing: 30) {
        TagView(name: "All")
        
        TagView(name: "Chest")
        
        TagView(name: "Push")
        
        TagView(name: "Tricep")
    }
}
