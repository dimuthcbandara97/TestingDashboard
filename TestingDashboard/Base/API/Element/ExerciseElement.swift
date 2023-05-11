//
//  ExerciseElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - ExerciseElement
import Foundation

// MARK: - ExerciseElement
struct ExerciseElement: Codable {
    let id, exerciseName, exerciseType, instructor: String
    let notes: String
    let imageurl, videourl: String
    let v: Int
    let affectingArea, bmiRange: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case exerciseName = "exercise_name"
        case exerciseType = "exercise_type"
        case instructor, notes, imageurl, videourl
        case v = "__v"
        case affectingArea = "affecting_area"
        case bmiRange = "bmi_range"
    }
}

typealias Exercise = [ExerciseElement]

