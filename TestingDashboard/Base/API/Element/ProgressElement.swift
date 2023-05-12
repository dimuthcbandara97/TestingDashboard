//
//  ProgressElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-26.
//

import Foundation

// MARK: - ProgressElement
//struct ProgressElement: Codable {
//    let id, progressName: String
//    let dailyCount: Int
//    let date: String
//    let month, v: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case progressName = "progress_name"
//        case dailyCount = "daily_count"
//        case date, month
//        case v = "__v"
//    }
//}
//
//typealias Progress = [ProgressElement]
struct ProgressElement: Codable {
    let progressName: String
    let dailyCount: Int
    let date: String
    let month: Int

    enum CodingKeys: String, CodingKey {
        case progressName = "progress_name"
        case dailyCount = "daily_count"
        case date, month
    }
}

typealias Progress = [ProgressElement]

