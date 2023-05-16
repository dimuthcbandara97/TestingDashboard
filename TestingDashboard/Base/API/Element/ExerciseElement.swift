//
//  ExerciseElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - ExerciseElement
struct ExerciseElement: Codable {
    let exerciseName, exerciseType, instructor: String
    let notes: String
    let imageurl, videourl: String
    let affectingArea, bmiRange: String
    let exerciseTime, repCount: Int

    enum CodingKeys: String, CodingKey {
        case exerciseName = "exercise_name"
        case exerciseType = "exercise_type"
        case instructor, notes, imageurl, videourl
        case affectingArea = "affecting_area"
        case bmiRange = "bmi_range"
        case exerciseTime = "exercise_time"
        case repCount = "rep_count"
    }
}

typealias Exercise = [ExerciseElement]

