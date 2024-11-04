//
//  lineChart.swift
//  chartsExample
//
//  Created by Danika Peet on 2024-11-04.
//

import SwiftUI
import Foundation
import Charts

struct WeatherData: Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Double
    
    init(year: Int, month: Int, day: Int, temperature: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.temperature = temperature
    }
}
struct lineChartView: View {
    var body: some View {
        VStack {
            Chart {
                ForEach(chartData, id: \.city) { series in
                    ForEach(series.data) { item in
                        LineMark(
                            x: .value("Month", item.date),
                            y: .value("Temp", item.temperature)
                        )
                        .interpolationMethod(.cardinal)
                    }
                    .foregroundStyle(by: .value("City", series.city))
                    .symbol(by: .value("City", series.city))
                }
            }
            }
            .frame(height: 300)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.defaultDigits))
                    
                }
            }
            .chartPlotStyle { plotArea in
                plotArea
                    .background(.blue.opacity(0.1))
            }
        }
        
    }
    

let hkWeatherData = [
    WeatherData(year: 2021, month: 7, day: 1, temperature: 30.0),
    WeatherData(year: 2021, month: 8, day: 1, temperature: 29.0),
    WeatherData(year: 2021, month: 9, day: 1, temperature: 30.0),
    WeatherData(year: 2021, month: 10, day: 1, temperature: 26.0),
    WeatherData(year: 2021, month: 11, day: 1, temperature: 23.0),
    WeatherData(year: 2021, month: 12, day: 1, temperature: 19.0),
    WeatherData(year: 2022, month: 1, day: 1, temperature: 18.0),
    WeatherData(year: 2022, month: 2, day: 1, temperature: 15.0),
    WeatherData(year: 2022, month: 3, day: 1, temperature: 22.0),
    WeatherData(year: 2022, month: 4, day: 1, temperature: 24.0),
    WeatherData(year: 2022, month: 5, day: 1, temperature: 26.0),
    WeatherData(year: 2022, month: 6, day: 1, temperature: 29.0)
]

let londonWeatherData = [
    WeatherData(year: 2021, month: 7, day: 1, temperature: 19.0),
    WeatherData(year: 2021, month: 8, day: 1, temperature: 17.0),
    WeatherData(year: 2021, month: 9, day: 1, temperature: 17.0),
    WeatherData(year: 2021, month: 10, day: 1, temperature: 13.0),
    WeatherData(year: 2021, month: 11, day: 1, temperature: 8.0),
    WeatherData(year: 2021, month: 12, day: 1, temperature: 8.0),
    WeatherData(year: 2022, month: 1, day: 1, temperature: 5.0),
    WeatherData(year: 2022, month: 2, day: 1, temperature: 8.0),
    WeatherData(year: 2022, month: 3, day: 1, temperature: 9.0),
    WeatherData(year: 2022, month: 4, day: 1, temperature: 11.0),
    WeatherData(year: 2022, month: 5, day: 1, temperature: 15.0),
    WeatherData(year: 2022, month: 6, day: 1, temperature: 18.0)
]

let taipeiWeatherData = [
    WeatherData(year: 2021, month: 7, day: 1, temperature: 31.0),
    WeatherData(year: 2021, month: 8, day: 1, temperature: 30.0),
    WeatherData(year: 2021, month: 9, day: 1, temperature: 30.0),
    WeatherData(year: 2021, month: 10, day: 1, temperature: 26.0),
    WeatherData(year: 2021, month: 11, day: 1, temperature: 22.0),
    WeatherData(year: 2021, month: 12, day: 1, temperature: 19.0),
    WeatherData(year: 2022, month: 1, day: 1, temperature: 17.0),
    WeatherData(year: 2022, month: 2, day: 1, temperature: 17.0),
    WeatherData(year: 2022, month: 3, day: 1, temperature: 21.0),
    WeatherData(year: 2022, month: 4, day: 1, temperature: 23.0),
    WeatherData(year: 2022, month: 5, day: 1, temperature: 24.0),
    WeatherData(year: 2022, month: 6, day: 1, temperature: 27.0)
]

let chartData = [ (city: "Hong Kong", data: hkWeatherData),
                  (city: "London", data: londonWeatherData),
                  (city: "Taipei", data: taipeiWeatherData) ]


#Preview {
    lineChartView()
}
