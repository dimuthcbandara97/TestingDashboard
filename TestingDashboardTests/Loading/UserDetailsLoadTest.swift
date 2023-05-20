//
//  UserDetailsLoadTest.swift
//  TestingDashboardTests
//
//  Created by Dimuth Bandara on 2023-05-20.
//

import Foundation
import XCTest

class UserDetailsLoaderTests: XCTestCase {
    func testLoadUserDetailsWithValidData() {
        let expectation = XCTestExpectation(description: "Load user details from API")
        let userDetailsLoader = UserDetailsLoader()

        userDetailsLoader.loadUserDetails { userDetails in
            XCTAssertGreaterThan(userDetails.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testLoadUserDetailsWithInvalidURL() {
        let expectation = XCTestExpectation(description: "Load user details from API with invalid URL")
        let userDetailsLoader = UserDetailsLoader()

        userDetailsLoader.loadUserDetails { userDetails in
            XCTAssertEqual(userDetails.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}

struct UserDetailssElement: Codable {
    // Define your UserDetailssElement structure here
}

class UserDetailsLoader {
    func loadUserDetails(completion: @escaping ([UserDetailssElement]) -> Void) {
        guard let url = URL(string: Constants2.API_KEY_USER_DETAILS) else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url, timeoutInterval: 30)) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }

            do {
                let results = try JSONDecoder().decode([UserDetailssElement].self, from: data)
                completion(results)
            } catch {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}

struct Constants2 {
    static let API_KEY_USER_DETAILS = "https://nodemongocrud.onrender.com/api/user_details"
}
