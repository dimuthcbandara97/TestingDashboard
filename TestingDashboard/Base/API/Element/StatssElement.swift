//
//  StatssElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-29.
//

import Foundation

// MARK: - StatssElement
//struct StatssElement: Codable {
//    let id, bloodpressure, heartrate, bmi: String
//    let bodyfat: String
//    let v: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case bloodpressure, heartrate, bmi, bodyfat
//        case v = "__v"
//    }
//}
//
//typealias Statss = [StatssElement]
struct StatssElement: Codable {
    let bloodpressure, heartrate, bmi: String
    let bodyfat: String

    enum CodingKeys: String, CodingKey {
        case bloodpressure, heartrate, bmi, bodyfat
    }
}

typealias Statss = [StatssElement]

