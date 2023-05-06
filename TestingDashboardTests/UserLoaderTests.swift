//
//  UserLoaderTests.swift
//  TestingDashboardTests
//
//  Created by Dimuth Bandara on 2023-05-06.
//

import Foundation
import XCTest

class UserLoaderTests: XCTestCase {
    // Test the loadUsers function with valid data
    func testLoadUsersWithValidData() {
        // Arrange
        let expectation = XCTestExpectation(description: "Load users from API")
        let userLoader = UserLoader()
        
        // Act
        userLoader.loadUsers { users in
            // Assert
            XCTAssertGreaterThan(users.count, 0)
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5.0)
    }
    
    // Test the loadUsers function with invalid URL
    func testLoadUsersWithInvalidURL() {
        // Arrange
        let expectation = XCTestExpectation(description: "Load users from API with invalid URL")
        let userLoader = UserLoader()
        
        // Act
        userLoader.loadUsers { users in
            // Assert
            XCTAssertEqual(users.count, 0)
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5.0)
    }
}

struct UserElement: Codable {
    let name, password, email: String
    let gender, status: String
    let imageurl: String

    enum CodingKeys: String, CodingKey {
        case name, password, email, gender, status, imageurl

    }
}

class UserLoader {
    func loadUsers(completion: @escaping ([UserElement]) -> Void) {
        guard let url = URL(string: Constants.API_KEY_USERS) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url, timeoutInterval: 30)) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            do {
                let results = try JSONDecoder().decode([UserElement].self, from: data)
                completion(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

struct Constants {
    static let API_KEY_USERS = "https://nodemongocrud.onrender.com/api/users"
}
