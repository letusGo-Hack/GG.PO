//
//  ChampionRow.swift
//  GGPO
//
//  Created by Daegeon Choi on 2023/06/10.
//

import SwiftUI

struct ChampionRow: View {
    let champion: Champion
    
    var body: some View {
        HStack {
            
            Circle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .padding()
            
            Text(champion.name).font(.title)
            
            Spacer()
            
            Text("\(champion.tier) Tier")
                .foregroundColor(self.getTierColor())
                .font(.headline)
            
        }
        .padding(10)
        .frame(height: 50)
    }
    
    private func getTierColor() -> Color {
        switch champion.tier {
        case 1:     return .blue
        case 2:     return .green
        case 3:     return .orange
        default:    return .gray
        }
    }
}

#Preview {
    ChampionRow(champion: Champion(name: "Leona", tier: 1, line: "Support"))
}
