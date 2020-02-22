//
//  CurrentWeather.swift
//  Weather
//
//  Created by Giorgi on 2/9/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import Foundation

struct CurrentWeather: Decodable {
    let weather: [CurrentWeatherWeather]
    let main: CurrentWeatherMain
    let wind: CurrentWeatherWind
    let clouds: CurrentWeatherClouds
    let sys: CurrentWeatherSys
    let name: String
}

struct CurrentWeatherWeather: Decodable {
    let main: String
    let icon: String
}

struct CurrentWeatherMain: Decodable {
    let temp: Double
    let pressure: Double
    let humidity: Double
}

struct CurrentWeatherWind: Decodable {
    let speed: Double
    let deg: Double
}

struct CurrentWeatherClouds: Decodable {
    let all: Double
}

struct CurrentWeatherSys: Decodable {
    let country: String
}
