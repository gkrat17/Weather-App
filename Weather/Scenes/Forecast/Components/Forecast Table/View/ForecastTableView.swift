//
//  ForecastTableView.swift
//  Weather
//
//  Created by Giorgi on 2/5/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ForecastTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    private func initialize() {
        registerCells()
    }

    private func registerCells() {
        register(UINib(nibName: ForecastTableViewRows.header.nibName(), bundle: nil), forHeaderFooterViewReuseIdentifier: ForecastTableViewRows.header.ID())

        register(UINib(nibName: ForecastTableViewRows.cell.nibName(), bundle: nil), forCellReuseIdentifier: ForecastTableViewRows.cell.ID())
    }

}

enum ForecastTableViewRows: String {
    
    case header = "ForecastSectionHeaderView"
    case cell = "ForecastCellView"
    
    func nibName() -> String {
        return rawValue
    }
    
    func ID() -> String {
        return rawValue
    }
    
}
