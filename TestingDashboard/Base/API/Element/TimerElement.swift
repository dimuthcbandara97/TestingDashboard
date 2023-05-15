//
//  TimerElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - TimerElement

struct TimerElement: Codable {
    let timerName: String
    let timePeriod: Int
    let futureDate: String

    enum CodingKeys: String, CodingKey {
        case timerName = "timer_name"
        case timePeriod = "time_period"
        case futureDate = "future_date"
    }
}

typealias Timerr = [TimerElement]

