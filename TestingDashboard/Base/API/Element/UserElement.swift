//
//  UserElement.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

//import Foundation
//
//// MARK: - UserElement
//struct UserElement: Codable {
//    let id, name, password, email: String
//    let gender: String
//    let imageurl: String
//    let v: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case name, password, email, gender, imageurl
//        case v = "__v"
//    }
//}
//
//typealias User = [UserElement]
import Foundation

// MARK: - UserElement
struct UserElement: Codable {
    let name, password, email: String
    let gender: String
    let imageurl: String

    enum CodingKeys: String, CodingKey {
        case name, password, email, gender, imageurl
    }
}

typealias User = [UserElement]

