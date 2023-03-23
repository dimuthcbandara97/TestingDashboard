//
//  YoutubeSearchResponse.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-23.
//

import Foundation



struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}

