//
//  ColorPaletteView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/24/24.
//

import SwiftUI

struct ColorPaletteView: View {
    var body: some View {
        ScrollView {
            PaletteCardView(title: "Main Colors") {
                MainColorView()
            }
            
            PaletteCardView(title: "Alert Colors") {
                AlertColorView()
            }
        }
    }
}

#Preview {
    ColorPaletteView()
}
