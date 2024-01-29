//
//  BackgroundColorView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/28/24.
//

import SwiftUI

struct BackgroundColorView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("BackgroundColor"))
                .frame(width: 350, height: 250)
                .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
        }
    }
}

#Preview {
    BackgroundColorView()
}
