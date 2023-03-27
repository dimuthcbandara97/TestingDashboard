//
//  UserElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - UserElement
struct UserElement: Codable {
    let id, name, password, email: String
    let gender, status: String
    let imageurl: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, password, email, gender, status, imageurl
        case v = "__v"
    }
}

typealias User = [UserElement]
