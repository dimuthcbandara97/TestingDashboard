//
//  StatsLoaderTests.swift
//  TestingDashboardTests
//
//  Created by Dimuth Bandara on 2023-05-20.
//

import Foundation
import XCTest

class StatsLoaderTests: XCTestCase {
    func testLoadStatsWithValidData() {
        let expectation = XCTestExpectation(description: "Load stats data from API")
        let statsLoader = StatsLoader()
        
        statsLoader.loadStats { stats in
            XCTAssertGreaterThan(stats.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadStatsWithInvalidURL() {
        let expectation = XCTestExpectation(description: "Load stats data from API with invalid URL")
        let statsLoader = StatsLoader()
        
        statsLoader.loadStats { stats in
            XCTAssertEqual(stats.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadStatsWithInvalidData() {
        let expectation = XCTestExpectation(description: "Load stats data from API with invalid data")
        let statsLoader = StatsLoader()
        
        statsLoader.loadStats { stats in
            XCTAssertEqual(stats.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}

struct StatssElement: Codable {
    // Define your StatssElement structure here
}

class StatsLoader {
    func loadStats(completion: @escaping ([StatssElement]) -> Void) {
        guard let url = URL(string: Constants7.API_KEY_STATS) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url, timeoutInterval: 30)) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion([])
                return
            }
            
            do {
                let results = try JSONDecoder().decode([StatssElement].self, from: data)
                completion(results)
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        }
        
        task.resume()
    }
}

struct Constants7 {
    static let API_KEY_STATS = "https://nodemongocrud.onrender.com/api/stats"
}
