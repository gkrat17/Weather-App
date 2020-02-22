//
//  ForecastSectionModel.swift
//  Weather
//
//  Created by Giorgi on 2/5/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import Foundation

class ForecastSectionModel {

    var sectionName: String
    var cells: [ForecastCellModel] = []

    init(sectionName: String) {
        self.sectionName = sectionName
    }

    func cellCount() -> Int {
        return cells.count
    }

    func getCell(atIndex i: Int) -> ForecastCellModel {
        return cells[i]
    }

}
