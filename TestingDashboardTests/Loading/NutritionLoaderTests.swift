//
//  NutritionLoaderTests.swift
//  TestingDashboardTests
//
//  Created by Dimuth Bandara on 2023-05-20.
//

import Foundation
import XCTest

class NutritionLoaderTests: XCTestCase {
    func testLoadNutritionWithValidData() {
        let expectation = XCTestExpectation(description: "Load nutrition data from API")
        let nutritionLoader = NutritionLoader()
        
        nutritionLoader.loadNutrition { nutrition in
            XCTAssertGreaterThan(nutrition.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadNutritionWithInvalidURL() {
        let expectation = XCTestExpectation(description: "Load nutrition data from API with invalid URL")
        let nutritionLoader = NutritionLoader()
        
        nutritionLoader.loadNutrition { nutrition in
            XCTAssertEqual(nutrition.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadNutritionWithInvalidData() {
        let expectation = XCTestExpectation(description: "Load nutrition data from API with invalid data")
        let nutritionLoader = NutritionLoader()
        
        nutritionLoader.loadNutrition { nutrition in
            XCTAssertEqual(nutrition.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}

struct NutritionElement: Codable {
    // Define your NutritionElement structure here
}

class NutritionLoader {
    func loadNutrition(completion: @escaping ([NutritionElement]) -> Void) {
        guard let url = URL(string: Constants5.API_KEY_NUTRITION) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url, timeoutInterval: 30)) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion([])
                return
            }
            
            do {
                let results = try JSONDecoder().decode([NutritionElement].self, from: data)
                completion(results)
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        }
        
        task.resume()
    }
}

struct Constants5 {
    static let API_KEY_NUTRITION = "https://nodemongocrud.onrender.com/api/nutrition"
}
