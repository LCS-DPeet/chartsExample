import Charts
//
//  ContentView.swift
//  chartsExample
//
//  Created by Danika Peet on 2024-11-04.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Day", "Monday"),
                y: .value("Steps", 6019)
            )

            BarMark(
                x: .value("Day", "Tuesday"),
                y: .value("Steps", 7200)
            )
        }
    }
}

struct ContentView2: View {
    var body: some View {
        let weekdays = Calendar.current.shortWeekdaySymbols
        let steps = [10531, 6019, 7200, 8311, 7403, 6503, 9230]
        Chart {
            ForEach(weekdays.indices, id: \.self) { index in
                BarMark(
                    x: .value("Steps", steps[index]),
                    y: .value("Day", weekdays[index])
                )

                .foregroundStyle(by: .value("Day", weekdays[index]))
                .annotation {
                    Text("\(steps[index])")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView2()
}
