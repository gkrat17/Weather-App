//
//  ForecastCellView.swift
//  Weather
//
//  Created by Giorgi on 2/5/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ForecastCellView: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var forecastIconImageView: UIImageView!

    func configure(from model: ForecastCellModel) {
        selectionStyle = .none

        timeLabel.text = model.time
        forecastLabel.text = model.forecast
        temperatureLabel.text = model.temperature
        forecastIconImageView.image = model.forecastImage
    }

}
