//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Giorgi on 2/9/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class CurrentWeatherViewModel {

    let city: String
    let countryCode: String
    let weather: String
    let cloudiness: String
    let humidity: String
    let pressure: String
    let windVelocity: String
    let windDirection: String
    var weatherIconImage: UIImage! // will be loaded using model.weather[0].icon

    init(_ model: CurrentWeather) {
        city = model.name
        countryCode = model.sys.country
        weather = "\(Int(model.main.temp))°C | \(model.weather[0].main)"
        cloudiness = "\(model.clouds.all) %"
        humidity = "\(model.main.humidity) mm"
        pressure = "\(model.main.pressure) hPa"
        windVelocity = "\(model.wind.speed) km/h"
        windDirection = "\(model.wind.deg)°" // FIXME
    }

    func toString() -> String {
        let array = [
            "City: \(city)",
            "Country Code: \(countryCode)",
            "Weather: \(weather)",
            "Cloudiness: \(cloudiness)",
            "Humidity: \(humidity)",
            "Pressure: \(pressure)",
            "Wind Velocity: \(windVelocity)",
            "Wind Direction: \(windDirection)"
        ]
        return array.joined(separator: ";\n")
    }

}
