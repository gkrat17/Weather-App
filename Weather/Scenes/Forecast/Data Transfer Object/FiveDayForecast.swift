//
//  FiveDayForecast.swift
//  Weather
//
//  Created by Giorgi on 2/9/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import Foundation

struct FiveDayForecast: Decodable {
    let list: [FiveDayForecastList]
}

struct FiveDayForecastList: Decodable {
    let main: FiveDayForecastListMain
    let weather: [FiveDayForecastListWeather]
    let dt_txt: String
}

struct FiveDayForecastListMain: Decodable {
    let temp: Double
}

struct FiveDayForecastListWeather: Decodable {
    let main: String
    let icon: String
}
