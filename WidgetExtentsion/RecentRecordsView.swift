//
//  RecentRecordsView.swift
//  GGPO
//
//  Created by 이창준 on 6/10/23.
//

import SwiftUI

struct RecentRecordsView: View {
    var entry: RecentProvider.Entry
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8)
    ]

    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 6) {
            ForEach(entry.records, id: \.id) { i in
                RoundedRectangle(cornerRadius: 4)
                    .fill(i.isWin ? .blue : .red)
                    .frame(height: 32)
            }
        }
    }
}

#Preview {
    RecentRecordsView(entry: RecentEntry(date: .now, records: [Record(date: .now, isWin: true)]))
}
