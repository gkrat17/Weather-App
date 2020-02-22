//
//  ForecastViewWeatherLoader.swift
//  Weather
//
//  Created by Giorgi on 2/12/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ForecastViewWeatherLoader: WeatherLoader<FiveDayForecast> {

    weak var viewController: ForecastViewController!

    init(viewController: ForecastViewController) {
        super.init(view: viewController.view, uri: "forecast")
        self.viewController = viewController
    }

    override func modelLoaded(_ model: FiveDayForecast) {
        viewController.forecastTable = ForecastTableModel(model)
        loadForecastIcons()
    }

    private func loadForecastIcons() {

        let lock = NSLock()
        var counter = 0

        for i in 0 ..< viewController.forecastTable.sectionCount() {
            let section = viewController.forecastTable.getSection(atIndex: i)

            for j in 0 ..< section.cellCount() {
                let cell = section.getCell(atIndex: j)

                loadWeatherIcon(named: cell.forecastImageName) { [weak self] (result) in
                    cell.forecastImage = result

                    lock.lock()
                    counter += 1
                    let current = counter
                    lock.unlock()

                    if current == self?.viewController.forecastTable.cellCount {
                        self?.finish()
                    }
                }
            }
        }
    }

    private func finish() {
        viewController.forecastTableView.reloadData()
        postconfigure()
    }

}
