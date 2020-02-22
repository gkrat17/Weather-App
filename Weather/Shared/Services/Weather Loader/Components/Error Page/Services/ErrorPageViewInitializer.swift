//
//  ErrorPageViewInitializer.swift
//  Weather
//
//  Created by Giorgi on 2/9/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import Foundation

func createErrorPageView(delegate: ErrorPageDelegate) -> ErrorPageView {
    let errorPageView = ErrorPageView()
    errorPageView.setDelegate(delegate)
    return errorPageView
}
