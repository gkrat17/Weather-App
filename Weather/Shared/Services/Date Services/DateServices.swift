//
//  DateServices.swift
//  Weather
//
//  Created by Giorgi on 2/10/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import Foundation

func getDayAndTime(_ date: String) -> (String, String)? {

    let dayAndTime = date.split(separator: " ")
    guard dayAndTime.count == 2 else { return nil }

    guard let day = getDayOfWeek(String(dayAndTime[0]))
    else { return nil }

    let time = String(dayAndTime[1].dropLast(3))
    return (day, time)
}

func getDayOfWeek(_ day: String) -> String? {

    var formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd"
    guard let date = formatter.date(from: day) else { return nil }

    formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    let weekDay = formatter.string(from: date)

    return weekDay
}
