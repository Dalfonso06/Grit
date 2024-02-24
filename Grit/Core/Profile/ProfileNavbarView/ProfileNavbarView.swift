//
//  ProfileNavbarView.swift
//  Grit
//
//  Created by Daniel Alfonso on 2/23/24.
//

import SwiftUI

struct ProfileNavbarView: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "gear")
                    .font(.largeTitle)
                    .padding()
            })
        }
    }
}

@available(iOS 17, *) #Preview(traits: .sizeThatFitsLayout) {
    ProfileNavbarView()
}
