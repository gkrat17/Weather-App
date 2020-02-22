//
//  TodayViewController.swift
//  Weather
//
//  Created by Giorgi on 2/2/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    var weatherLoader: TodayViewWeatherLoader!

    @IBOutlet weak var currentWeatherView: CurrentWeatherView!
    var currentWeatherViewModel: CurrentWeatherViewModel!

    @IBOutlet weak var shareButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherLoader = TodayViewWeatherLoader(viewController: self)
        weatherLoader.configure()
    }

    @IBAction func refreshTapped() {
        weatherLoader.configure()
    }

    @IBAction func shareTapped() {
        let shareController = UIActivityViewController(activityItems: [currentWeatherViewModel.toString()], applicationActivities: nil)
        present(shareController, animated: true, completion: nil)
    }

}
