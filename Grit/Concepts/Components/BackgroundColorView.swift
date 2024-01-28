//
//  BackgroundColorView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/27/24.
//

import SwiftUI

struct BackgroundColorView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 325, height: 215)
                .shadow(
                    color: Color("BackgroundColor"),
                    radius: 8,
                    x: -8,
                    y: -8)
                .shadow(
                    color: Color("AccentColor"),
                    radius: 8,
                    x: 8,
                    y: 8
                )
                .foregroundColor(Color("BackgroundColor"))
        }
    }
}

#Preview {
    BackgroundColorView()
}
