//
//  MeditationLoaderTests.swift
//  TestingDashboardTests
//
//  Created by Dimuth Bandara on 2023-05-20.
//

import Foundation
import XCTest

class MeditationLoaderTests: XCTestCase {
    func testLoadMeditationWithValidData() {
        let expectation = XCTestExpectation(description: "Load meditation data from API")
        let meditationLoader = MeditationLoader()

        meditationLoader.loadMeditation { meditations in
            XCTAssertGreaterThan(meditations.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testLoadMeditationWithInvalidURL() {
        let expectation = XCTestExpectation(description: "Load meditation data from API with invalid URL")
        let meditationLoader = MeditationLoader()

        meditationLoader.loadMeditation { meditations in
            XCTAssertEqual(meditations.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testLoadMeditationWithInvalidData() {
        let expectation = XCTestExpectation(description: "Load meditation data from API with invalid data")
        let meditationLoader = MeditationLoader()

        meditationLoader.loadMeditation { meditations in
            XCTAssertEqual(meditations.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}

struct MeditationElement: Codable {
    // Define your MeditationElement structure here
}

class MeditationLoader {
    func loadMeditation(completion: @escaping ([MeditationElement]) -> Void) {
        guard let url = URL(string: Constants4.API_KEY_MEDITATION) else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url, timeoutInterval: 30)) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion([])
                return
            }

            do {
                let results = try JSONDecoder().decode([MeditationElement].self, from: data)
                completion(results)
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        }

        task.resume()
    }
}

struct Constants4 {
    static let API_KEY_MEDITATION = "https://nodemongocrud.onrender.com/api/meditation"
}

