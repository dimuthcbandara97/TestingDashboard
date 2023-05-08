//
//  UserDetailssElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-05-08.
//

import Foundation

// MARK: - UserDetailssElement
struct UserDetailssElement: Codable {
    let id, status: String
    let height, weight, age: Int
    let fitnessGoal: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case status, height, weight, age
        case fitnessGoal = "fitness_goal"
        case v = "__v"
    }
}

typealias UserDetailss = [UserDetailssElement]
