//
//  CurrentWeatherIconView.swift
//  Weather
//
//  Created by Giorgi on 2/3/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class CurrentWeatherIconView: ViewWithContentView {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var forecastLabel: UILabel!

    func configure(from model: CurrentWeatherIconViewModel) {
        setForecast(model.value)
        setIcon(named: model.iconImageName)
    }

    func setForecast(_ text: String) {
        forecastLabel.text = text
    }

    func setIcon(named iconImageName: String) {
        if let iconImage = UIImage(named: iconImageName) {
            iconImageView.tintColor = UIColor.gold
            iconImageView.image = iconImage.withRenderingMode(.alwaysTemplate)
        } else {
            fatalError("no image found with name: " + iconImageName)
        }
    }

}
