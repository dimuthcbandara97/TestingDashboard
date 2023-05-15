//
//  NutritionElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

// MARK: - NutritionElement
struct NutritionElement: Codable {
    let foodName, value, recomendedBy: String
    let whyRecomended: String
    let imageurl, videourl: String

    enum CodingKeys: String, CodingKey {
        case foodName = "food_name"
        case value
        case recomendedBy = "recomended_by"
        case whyRecomended = "why_recomended"
        case imageurl, videourl
    }
}

typealias Nutrition = [NutritionElement]

