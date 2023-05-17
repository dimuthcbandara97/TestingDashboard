//
//  ExerciseElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation


// MARK: - ExerciseElement
struct ExerciseElement: Codable {
    let exerciseName: String
    let exerciseType: String
    let instructor: String
    let notes: String
    let imageurl: String
    let videourl: String
    let affectingArea: String
    let bmiRange: String
    let exerciseTime: Int
    let repCount: Int
    let fitnessGoal: String

    enum CodingKeys: String, CodingKey {
        case exerciseName = "exercise_name"
        case exerciseType = "exercise_type"
        case instructor, notes, imageurl, videourl
        case affectingArea = "affecting_area"
        case bmiRange = "bmi_range"
        case exerciseTime = "exercise_time"
        case repCount = "rep_count"
        case fitnessGoal = "fitness_goal"
    }
}

typealias Exercise = [ExerciseElement]


