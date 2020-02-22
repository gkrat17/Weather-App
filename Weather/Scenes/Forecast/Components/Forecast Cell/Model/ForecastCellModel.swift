//
//  ForecastCellModel.swift
//  Weather
//
//  Created by Giorgi on 2/5/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ForecastCellModel {

    let time: String
    let forecast: String
    let temperature: String
    let forecastImageName: String
    var forecastImage: UIImage! // will be loaded using model.list[i].weather[0].icon

    init (
        time: String,
        forecast: String,
        temperature: String,
        forecastImageName: String,
        forecastImage: UIImage?
    ) {
        self.time = time
        self.forecast = forecast
        self.temperature = temperature
        self.forecastImageName = forecastImageName
        self.forecastImage = forecastImage
    }

}
