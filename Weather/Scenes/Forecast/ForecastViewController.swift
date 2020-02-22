//
//  ForecastViewController.swift
//  Weather
//
//  Created by Giorgi on 2/2/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    var weatherLoader: ForecastViewWeatherLoader!

    lazy var forecastTable = ForecastTableModel()
    @IBOutlet weak var forecastTableView: ForecastTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherLoader = ForecastViewWeatherLoader(viewController: self)
        weatherLoader.configure()
    }

    @IBAction func refreshTapped() {
        weatherLoader.refreshTapped()
    }

}

extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return forecastTable.sectionCount()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastTable.cellCount(inSection: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let forecastSectionHeaderView = forecastTableView.dequeueReusableHeaderFooterView(withIdentifier: ForecastTableViewRows.header.ID()) as! ForecastSectionHeaderView

        let sectionName = forecastTable.getSectionName(ofSection: section)

        forecastSectionHeaderView.setSectionName(sectionName)
        return forecastSectionHeaderView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let forecastCellView = forecastTableView.dequeueReusableCell(withIdentifier: ForecastTableViewRows.cell.ID(), for: indexPath) as! ForecastCellView

        let forecastCellModel = forecastTable.getCell(sectionAndRow: indexPath)

        forecastCellView.configure(from: forecastCellModel)
        return forecastCellView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

}
