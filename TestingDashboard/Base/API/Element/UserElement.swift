//
//  UserElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - UserssElement
struct UserElement: Codable {
    let id, name, email, gender: String
    let status, imageurl: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email, gender, status, imageurl
        case v = "__v"
    }
}

typealias User = [UserElement]

