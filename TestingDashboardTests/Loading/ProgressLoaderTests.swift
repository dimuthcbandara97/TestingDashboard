//
//  ProgressLoaderTests.swift
//  TestingDashboardTests
//
//  Created by Dimuth Bandara on 2023-05-20.
//

import Foundation
import XCTest

class ProgressLoaderTests: XCTestCase {
    func testLoadProgressWithValidData() {
        let expectation = XCTestExpectation(description: "Load progress data from API")
        let progressLoader = ProgressLoader()

        progressLoader.loadProgress { progress in
            XCTAssertGreaterThan(progress.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testLoadProgressWithInvalidURL() {
        let expectation = XCTestExpectation(description: "Load progress data from API with invalid URL")
        let progressLoader = ProgressLoader()

        progressLoader.loadProgress { progress in
            XCTAssertEqual(progress.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testLoadProgressWithInvalidData() {
        let expectation = XCTestExpectation(description: "Load progress data from API with invalid data")
        let progressLoader = ProgressLoader()

        progressLoader.loadProgress { progress in
            XCTAssertEqual(progress.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}

struct ProgressElement: Codable {
    // Define your ProgressElement structure here
}

class ProgressLoader {
    func loadProgress(completion: @escaping ([ProgressElement]) -> Void) {
        guard let url = URL(string: Constants6.API_KEY_PROGRESS) else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url, timeoutInterval: 30)) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion([])
                return
            }

            do {
                let results = try JSONDecoder().decode([ProgressElement].self, from: data)
                completion(results)
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        }

        task.resume()
    }
}

struct Constants6 {
    static let API_KEY_PROGRESS = "https://nodemongocrud.onrender.com/api/progress"
}
