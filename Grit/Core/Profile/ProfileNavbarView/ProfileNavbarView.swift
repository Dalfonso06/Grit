//
//  ProfileNavbarView.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/23/24.
//

import SwiftUI

struct ProfileNavbarView: View {
    
    @State var fullname: String
    
    var body: some View {
        HStack {
            Text(fullname)
                .font(.title2)
                .padding()
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "gear")
                    .font(.title2)
                    .padding()
            })
        }
        .overlay(
            Rectangle()
                .stroke(.gray, lineWidth: 1)
                .frame(width: nil, height: 1) // Set height to 1 for bottom line
                .offset(y: 20)
        )
    }
}

@available(iOS 17, *) #Preview(traits: .sizeThatFitsLayout) {
    ProfileNavbarView(fullname: "Daniel Alfonso")
        .padding()
}
