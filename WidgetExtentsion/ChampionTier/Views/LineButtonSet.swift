//
//  LaneButton.swift
//  GGPO
//
//  Created by Daegeon Choi on 2023/06/10.
//

import SwiftUI

enum Line: String {
    case top = "top"
    case jungle = "jungle"
    case middle = "middle"
    case bottom = "bottom"
    case support = "utility"
    
    // TODO: 실제 아이콘으로 변경
    var selected: String {
        return "icon-position-\(self.rawValue)"
    }
    
    var unselected: String {
        return "icon-position-\(self.rawValue)-disabled"
    }

}

struct LineButtonSet: View {
    
    @Binding var selectedLine: Line
    let lines: [Line] = [.top, .jungle, .middle, .bottom, .support]
    
    var body: some View {
        
        HStack(spacing: 5) {
            ForEach(lines, id: \.rawValue) { line in
                Button(action: {
                    selectedLine = line
                }, label: {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(.blue)
                        .frame(width: 50, height: 50)
                        .overlay(alignment: .center) {
                            Image(self.getImageName(line))
                                .resizable()
                                .tint(.yellow)
                                .frame(width: 40, height: 40)
                        }
                })
                .buttonStyle(.plain)
            }
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
    LineButtonSet(selectedLine: Binding.constant(.support))
}
