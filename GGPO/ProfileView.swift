//
//  ProfileView.swift
//  GGPO
//
//  Created by Daegeon Choi on 2023/06/10.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        
        VStack {
            Color.clear
            
            VStack {
                
                Circle()
                    .strokeBorder(.white, lineWidth: 5)
                    .background(Circle().fill(.black))
                    .frame(width: 200, height: 200)
                    .overlay(alignment: .center) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.yellow)
                    }
                
                Text("\(user.point)")
                    .font(.title)
                    .italic()
                    .foregroundColor(.black)
                
                Spacer().frame(height: 20)
                
                Text(user.name)
                    .font(.largeTitle)
                    .italic()
                    .fontWeight(.heavy)
                    .foregroundColor(.white)

            }.padding()
            
            
        }
        .background(Color.brown)
        
    }
}

#Preview {
    ProfileView(user: User(name: "Bro Morgan", tier: "Master", point: 41, mostChapion: Champion(name: "Nar", tier: 1, line: "Top")))
}
