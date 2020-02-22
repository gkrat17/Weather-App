//
//  ErrorMessages.swift
//  Weather
//
//  Created by Giorgi on 2/9/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import Foundation

class ErrorMessages {

    static let enableLocationServices = "Please enable Location Services in your Settings."
    static let noCoorinates = "No coordinates were initialized while determining location."
    static let didNotResponsed = "Application did not get requested data."
    static func httpError(_ statucCode: Int) -> String {
        return "HTTP Error occured with error code \(statucCode)"
    }
    static let missingData = "The data couldn't be read because it is missing."

}
