//
//  RecentWidgetView.swift
//  GGPO
//
//  Created by 이창준 on 6/10/23.
//

import SwiftUI
import WidgetKit

struct RecentWidgetView: View {
    var body: some View {
        HStack {
            VStack {
                Text("오늘 승률")
                    .font(.system(size: 16, weight: .bold))

                Text("10%")
                    .font(.system(size: 32, weight: .bold))

                Image(systemName: "arrow.clockwise.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.green)
            }
        }
    }
}
