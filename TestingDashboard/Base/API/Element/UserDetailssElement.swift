//
//  UserDetailssElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-05-08.
//

import Foundation

// MARK: - UserDetailssElement
struct UserDetailssElement: Codable {
    let status: String
    let height, weight, age: Int
    let fitnessGoal, email: String

    enum CodingKeys: String, CodingKey {
        case status, height, weight, age
        case fitnessGoal = "fitness_goal"
        case email
    }
}

typealias UserDetailss = [UserDetailssElement]


