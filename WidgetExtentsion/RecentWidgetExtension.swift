//
//  RecentWidgetExtension.swift
//  GGPO
//
//  Created by 이창준 on 6/10/23.
//

import SwiftUI
import WidgetKit

struct RecentProvider: TimelineProvider {
    func placeholder(in context: Context) -> RecentEntry {
        RecentEntry(date: .now, records: [])
    }

    func getSnapshot(in context: Context, completion: @escaping (RecentEntry) -> Void) {
        let entry = RecentEntry(date: .now, records: [Record(date: .now, isWin: true)])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<RecentEntry>) -> Void) {
        var entries: [RecentEntry] = [
            RecentEntry(date: .now, records: [
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: false),
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: true)
            ])
        ]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// MARK: - Widget

struct RecentWidgetExtension: Widget {
    let kind: String = "RecentWidgetExtension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: RecentProvider()) { entry in
            HStack(alignment: .top, spacing: 24) {
                RecentInfoView(entry: entry)
                RecentRecordsView(entry: entry)
            }
            .containerBackground(.background.tertiary, for: .widget)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Recent Widget")
        .description("최근 전적을 보여주는 위젯입니다.")
        .supportedFamilies([.systemMedium])
    }
}

// MARK: - Entry

struct RecentEntry: TimelineEntry {
    let date: Date
    let records: [Record]
}

#Preview(as: .systemMedium) {
    RecentWidgetExtension()
} timeline: {
    RecentEntry(
        date: .now,
        records: [
            Record(date: .now, isWin: true),
            Record(date: .now, isWin: true),
            Record(date: .now, isWin: false),
            Record(date: .now, isWin: false),
            Record(date: .now, isWin: false),
            Record(date: .now, isWin: true),
            Record(date: .now, isWin: false)
        ]
    )
}
