//
//  ForecastTableModel.swift
//  Weather
//
//  Created by Giorgi on 2/5/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import Foundation

class ForecastTableModel {

    var sections: [ForecastSectionModel] = []
    var cellCount = 0

    init() { }

    init(_ model: FiveDayForecast) {

        let forecasts = model.list
        
        guard forecasts.count > 0 else { return }
        guard let (day, _) = getDayAndTime(forecasts[0].dt_txt) else { return }

        sections.append(ForecastSectionModel(sectionName: day))

        for i in 0..<forecasts.count {
            let forecast = forecasts[i]

            if let (day, time) = getDayAndTime(forecast.dt_txt) {

                let forecastModel = ForecastCellModel (
                    time: time,
                    forecast: forecast.weather[0].main,
                    temperature: "\(Int(forecast.main.temp))°C",
                    forecastImageName: forecast.weather[0].icon,
                    forecastImage: nil
                )

                var lastSection = sections.last!

                if lastSection.sectionName != day {
                    sections.append(ForecastSectionModel(sectionName: day))
                    lastSection = sections.last!
                }

                lastSection.cells.append(forecastModel)
                cellCount += 1
            }
        }
    }

    func sectionCount() -> Int {
        return sections.count
    }

    func cellCount(inSection i: Int) -> Int {
        return sections[i].cellCount()
    }

    func getSectionName(ofSection i: Int) -> String {
        return sections[i].sectionName
    }

    func getCell(sectionAndRow i: IndexPath) -> ForecastCellModel {
        return sections[i.section].getCell(atIndex: i.row)
    }

    func getSection(atIndex i: Int) -> ForecastSectionModel {
        return sections[i]
    }
}
