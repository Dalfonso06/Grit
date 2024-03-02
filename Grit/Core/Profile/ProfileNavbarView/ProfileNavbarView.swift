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
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "gear")
                    .font(.title2)
                    .padding(.horizontal)
            })
        }
        .padding(.vertical)
    }
}

@available(iOS 17, *) #Preview(traits: .sizeThatFitsLayout) {
    ProfileNavbarView(fullname: "Daniel Alfonso")
}
