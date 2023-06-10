//
//  LaneButton.swift
//  GGPO
//
//  Created by Daegeon Choi on 2023/06/10.
//

import SwiftUI

enum Line: String {
    case top
    case jungle
    case mid
    case bot
    case support
    
    // TODO: 실제 아이콘으로 변경
    var selected: String {
        return "star.fill"
    }
    
    var unselected: String {
        return "star"
    }

}

struct LineButtonSet: View {
    
    @Binding var selectedLine: Line
    let lines: [Line] = [.top, .jungle, .mid, .bot, .support]
    
    var body: some View {
        
        HStack(spacing: 5) {
            ForEach(lines, id: \.rawValue) { line in
                Button(action: {
                    selectedLine = line
                }, label: {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(self.getFillColor(line))
                        .stroke(.blue)
                        .frame(width: 50, height: 50)
                        .overlay(alignment: .center) {
                            Image(systemName: self.getImageName(line))
                                .resizable()
                                .tint(.yellow)
                                .frame(width: 40, height: 40)
                        }
                })
                .buttonStyle(.plain)
            }
        }
    }
    
    private func getFillColor(_ line: Line) -> Color {
        if line == self.selectedLine {
            return .blue
        } else {
            return .white
        }
    }
    
    private func getImageName(_ line: Line) -> String {
        if line == self.selectedLine {
            return line.selected
        } else {
            return line.unselected
        }
    }
}

#Preview {
    LineButtonSet(selectedLine: Binding.constant(.bot))
}
