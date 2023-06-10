//
//  WelcomeView.swift
//  GGPO
//
//  Created by Daegeon Choi on 2023/06/10.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        @State var username: String = ""
        
        VStack {
            Spacer()
            
            Text("GG.OP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            
            Spacer()
            
            VStack(spacing: 20) {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(height: 50)
                    .overlay(alignment: .center) {
                        TextField("Username", text: $username)
                            .padding()
                    }
                
                NavigationLink {
                    // TODO: ProfileView 연결
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(height: 50)
                        .overlay(alignment: .center) {
                            Text("Start")
                                .foregroundColor(.black)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                }

            }
            .padding()
            
        }
        
        
        .background(.blue)
    }
}

#Preview {
    WelcomeView()
}
