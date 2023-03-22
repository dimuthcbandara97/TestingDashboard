//
//  ExerciseElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - ExerciseElement
struct ExerciseElement: Codable {
    let id, exerciseName, exerciseType, instructor: String
    let notes, imageurl: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case exerciseName = "exercise_name"
        case exerciseType = "exercise_type"
        case instructor, notes, imageurl
        case v = "__v"
    }
}

typealias Exercise = [ExerciseElement]

