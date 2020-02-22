//
//  TodayViewWeatherLoader.swift
//  Weather
//
//  Created by Giorgi on 2/12/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class TodayViewWeatherLoader: WeatherLoader<CurrentWeather> {

    weak var viewController: TodayViewController!

    init(viewController: TodayViewController) {
        super.init(view: viewController.view, uri: "weather")
        self.viewController = viewController
    }

    override func preconfigure() {
        viewController.shareButton.isEnabled = false
    }

    override func modelLoaded(_ model: CurrentWeather) {
        viewController.currentWeatherViewModel = CurrentWeatherViewModel(model)
        loadWeatherIcon(named: model.weather[0].icon) { [weak self] (result) in
            self?.viewController.currentWeatherViewModel.weatherIconImage = result
            self?.finish()
        }
    }

    private func finish() {
        viewController.currentWeatherView.configure(from: viewController.currentWeatherViewModel)
        postconfigure()
        viewController.shareButton.isEnabled = true
    }

}
