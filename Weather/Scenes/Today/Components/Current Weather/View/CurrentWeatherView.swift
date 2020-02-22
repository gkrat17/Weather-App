//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Giorgi on 2/3/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class CurrentWeatherView: ViewWithContentView {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityAndCountryCodeLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!

    @IBOutlet weak var cloudinessForecastIconView: CurrentWeatherIconView!
    @IBOutlet weak var humidityForecastIconView: CurrentWeatherIconView!
    @IBOutlet weak var pressureForecastIconView: CurrentWeatherIconView!
    @IBOutlet weak var windVelocityForecastIconView: CurrentWeatherIconView!
    @IBOutlet weak var windDirectionForecastIconView: CurrentWeatherIconView!

    func configure(from model: CurrentWeatherViewModel) {

        setForecastIconImage(model.weatherIconImage)
        setCityAndCountryCode(city: model.city, countryCode: model.countryCode)
        setWeather(model.weather)

        configureForecastIconViews(from: model)
    }

    func setForecastIconImage(_ image: UIImage?) {
        weatherIconImageView.image = image
    }

    func setCityAndCountryCode(city: String, countryCode: String) {
        cityAndCountryCodeLabel.text = city + ", " + countryCode
    }

    func setWeather(_ forecast: String) {
        weatherLabel.text = forecast
    }

    private func configureForecastIconViews(from model: CurrentWeatherViewModel) {
        initForecastIconView (
            cloudinessForecastIconView,
            iconImageName: "Cloud",
            withForecast: model.cloudiness
        )
        initForecastIconView (
            humidityForecastIconView,
            iconImageName: "Drop",
            withForecast: model.humidity
        )
        initForecastIconView (
            pressureForecastIconView,
            iconImageName: "Celsius",
            withForecast: model.pressure
        )
        initForecastIconView (
            windVelocityForecastIconView,
            iconImageName: "Wind",
            withForecast: model.windVelocity
        )
        initForecastIconView (
            windDirectionForecastIconView,
            iconImageName: "Compass",
            withForecast: model.windDirection
        )
    }

    private func initForecastIconView(_ forecastIconView: CurrentWeatherIconView, iconImageName: String, withForecast forecast: String) {

        forecastIconView.configure (
            from: CurrentWeatherIconViewModel (
                iconImageName: iconImageName,
                value: forecast
            )
        )

    }

}
