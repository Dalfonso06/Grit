//
//  ProfileHeaderView.swift
//  Grit
//
//  Created by Daniel Alfonso on 4/13/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State var firstname: String
    @State var profilePicture: String
    
    var body: some View {
        VStack {
            HStack {
                Image(profilePicture)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(
                        RoundedRectangle(cornerRadius: DesignConstants.cornerRadius)
                    )
                
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Hello \(firstname)")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    Text("Welcome")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(DesignConstants.padding)
        .background()
        .cornerRadius(DesignConstants.cornerRadius)
        .padding(DesignConstants.padding)
    }
}

#Preview {
    ZStack {
        Color("BackgroundColor")
            .ignoresSafeArea()
        
        ProfileHeaderView(firstname: "Daniel", profilePicture: "GritPFP")
    }
}
