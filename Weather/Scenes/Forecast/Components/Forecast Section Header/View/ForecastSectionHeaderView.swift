//
//  ForecastSectionHeaderView.swift
//  Weather
//
//  Created by Giorgi on 2/5/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ForecastSectionHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var sectionNameLabel: UILabel!

    func setSectionName(_ sectionName: String) {
        sectionNameLabel.text = sectionName.uppercased()
    }

}
