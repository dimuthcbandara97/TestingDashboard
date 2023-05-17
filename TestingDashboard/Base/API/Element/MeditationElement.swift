//
//  MeditationElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - MeditationElement
struct MeditationElement: Codable {
    let meditationName: String
    let meditationType: String
    let instructor: String
    let notes: String
    let imageurl: String
    let videourl: String
    let fitnessGoal: String

    enum CodingKeys: String, CodingKey {
        case meditationName = "meditation_name"
        case meditationType = "meditation_type"
        case instructor, notes, imageurl, videourl
        case fitnessGoal = "fitness_goal"
    }
}

typealias Meditation = [MeditationElement]
