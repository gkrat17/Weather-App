//
//  ErrorPageModel.swift
//  Weather
//
//  Created by Giorgi on 2/9/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ErrorPageModel {

    let errorMessage: String
    let superView: UIView

    init(errorMessage: String, superView: UIView) {
        self.errorMessage = errorMessage
        self.superView = superView
    }

}
