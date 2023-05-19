//
//  NutritionElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - NutritionElement
struct NutritionElement: Codable {
    let foodName: String
    let value: String
    let recomendedBy: String
    let whyRecomended: String
    let imageurl: String
    let videourl: String
    let fitnessGoal: String
    
    enum CodingKeys: String, CodingKey {
        case foodName = "food_name"
        case value
        case recomendedBy = "recomended_by"
        case whyRecomended = "why_recomended"
        case imageurl, videourl
        case fitnessGoal = "fitness_goal"
    }
}

typealias Nutrition = [NutritionElement]


