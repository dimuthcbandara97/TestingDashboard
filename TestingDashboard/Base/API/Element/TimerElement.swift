//
//  TimerElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - TimerElement
struct TimerElement: Codable {
    let id, timerName: String
    let timePeriod: Int
    let futureDate: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case timerName = "timer_name"
        case timePeriod = "time_period"
        case futureDate = "future_date"
        case v = "__v"
    }
}

typealias Timerr = [TimerElement]

