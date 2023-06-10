//
//  ChampionTierWidget.swift
//  GGPO
//
//  Created by Daegeon Choi on 2023/06/10.
//

import WidgetKit
import SwiftUI

struct ChampionTierProvider: TimelineProvider {
    func placeholder(in context: Context) -> ChampionEntry {
        ChampionEntry(date: Date(), champions: [Champion(name: "Leona", tier: 1, line: "Support")])
    }

    func getSnapshot(in context: Context, completion: @escaping (ChampionEntry) -> ()) {
        let entry = ChampionEntry(date: Date(), champions: [Champion(name: "Leona", tier: 1, line: "Support")])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [ChampionEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = ChampionEntry(date: entryDate, champions: [Champion(name: "Leona", tier: 1, line: "Support")])
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ChampionEntry: TimelineEntry {
    let date: Date
    let champions: [Champion]
}

struct ChampionTierWidgetExtentsionEntryView : View {
    var entry: ChampionTierProvider.Entry
    @State private var selectedLine: Line = .top

    var body: some View {
        VStack {
            
            ForEach(entry.champions[0...3], id: \.name) { champion in
                ChampionRow(champion: champion)
                Divider()
            }
            
            Spacer()
            
            LineButtonSet(selectedLine: $selectedLine)
        }
        .padding()
        .containerBackground(.fill.tertiary, for: .widget)
        
    }
}

struct ChampionTierWidgetExtentsion: Widget {
    let kind: String = "ChampionTierWidgetExtentsion"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ChampionTierProvider()) { entry in
            ChampionTierWidgetExtentsionEntryView(entry: entry)
        }
        .configurationDisplayName("Champion Tier")
        .description("This is an example tier widget.")
    }
}

#Preview(as: .systemExtraLarge) {
    ChampionTierWidgetExtentsion()
} timeline: {
    ChampionEntry(date: .now, champions: [
        Champion(name: "Leona", tier: 1, line: "Support"),
        Champion(name: "Nar", tier: 3, line: "Top"),
        Champion(name: "Leona", tier: 1, line: "Support"),
        Champion(name: "Nar", tier: 3, line: "Top")
    ])
}

