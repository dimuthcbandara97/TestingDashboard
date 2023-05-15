//
//  NetworkingElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - NetworkingElement

struct NetworkingElement: Codable {
    let competitorName, gender, workouts: String
    let performance, imageurl: String

    enum CodingKeys: String, CodingKey {
        case competitorName = "competitor_name"
        case gender, workouts, performance, imageurl
    }
}

typealias Networking = [NetworkingElement]


