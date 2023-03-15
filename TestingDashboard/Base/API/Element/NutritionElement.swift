//
//  NutritionElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - NutritionElement
struct NutritionElement: Codable {
    let id, foodName, value, recomendedBy: String
    let whyRecomended: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case foodName = "food_name"
        case value
        case recomendedBy = "recomended_by"
        case whyRecomended = "why_recomended"
        case v = "__v"
    }
}

typealias Nutrition = [NutritionElement]
