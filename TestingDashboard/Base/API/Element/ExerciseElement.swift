//
//  ExerciseElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import Foundation

import Foundation

// MARK: - ExerciseElement
struct ExerciseElement: Codable {
    let id, name, email, gender: String?
    let status: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email, gender, status
        case v = "__v"
    }
}

typealias Exercise = [ExerciseElement]
