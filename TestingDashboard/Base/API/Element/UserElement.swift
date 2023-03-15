//
//  UserElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - UserElement
struct UserElement: Codable {
    let id, name, email, gender: String
    let status: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email, gender, status
        case v = "__v"
    }
}

typealias User = [UserElement]

