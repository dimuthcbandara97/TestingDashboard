//
//  NetworkingElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - NetworkingElement
struct NetworkingElement: Codable {
    let id, competitorName, gender, workouts: String
    let performance, imageurl: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case competitorName = "competitor_name"
        case gender, workouts, performance, imageurl
        case v = "__v"
    }
}

typealias Networking = [NetworkingElement]

