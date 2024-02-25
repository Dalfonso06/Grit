//
//  ProfileView.swift
//  Grit
//
//  Created by Daniel Alfonso on 1/16/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State var fullname: String
    
    var body: some View {
        NavigationView {
            VStack {
                ProfileNavbarView(fullname: fullname)
                
                ScrollView {
                    
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(fullname: "Daniel Alfonso")
    }
}
