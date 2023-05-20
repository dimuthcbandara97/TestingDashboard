//
//  LoadExerciseTests.swift
//  TestingDashboardTests
//
//  Created by Dimuth Bandara on 2023-05-20.
//

import Foundation
import XCTest

class ExerciseLoaderTests: XCTestCase {
    func testLoadExerciseWithValidData() {
        let expectation = XCTestExpectation(description: "Load exercise data from API")
        let exerciseLoader = ExerciseLoader()

        exerciseLoader.loadExercise { exercises in
            XCTAssertGreaterThan(exercises.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testLoadExerciseWithInvalidURL() {
        let expectation = XCTestExpectation(description: "Load exercise data from API with invalid URL")
        let exerciseLoader = ExerciseLoader()

        exerciseLoader.loadExercise { exercises in
            XCTAssertEqual(exercises.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testLoadExerciseWithInvalidData() {
        let expectation = XCTestExpectation(description: "Load exercise data from API with invalid data")
        let exerciseLoader = ExerciseLoader()

        exerciseLoader.loadExercise { exercises in
            XCTAssertEqual(exercises.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}

struct ExerciseElement: Codable {
    // Define your ExerciseElement structure here
}

class ExerciseLoader {
    func loadExercise(completion: @escaping ([ExerciseElement]) -> Void) {
        guard let url = URL(string: Constants3.API_KEY_EXERCISE) else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url, timeoutInterval: 30)) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion([])
                return
            }

            do {
                let results = try JSONDecoder().decode([ExerciseElement].self, from: data)
                completion(results)
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        }

        task.resume()
    }
}

struct Constants3 {
    static let API_KEY_EXERCISE = "https://nodemongocrud.onrender.com/api/exercise"
}
