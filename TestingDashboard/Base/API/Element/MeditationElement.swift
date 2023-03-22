//
//  MeditationElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - MeditationElement
struct MeditationElement: Codable {
    let id, meditationName, meditationType, instructor: String
    let notes, imageurl: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case meditationName = "meditation_name"
        case meditationType = "meditation_type"
        case instructor, notes, imageurl
        case v = "__v"
    }
}

typealias Meditation = [MeditationElement]

