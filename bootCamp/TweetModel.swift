//
//  TweetModel.swift
//  bootCamp
//
//  Created by Cem Kazım on 20.01.2021.
//

import Foundation

struct TweetList: Codable {
    
    let tweets: [TweetModel]
    
    enum CodingKeys: String, CodingKey {
        case tweets
    }
}

struct TweetModel: Codable {
    
    let username: String?
    let description: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case username
        case description
        case imageUrl
    }
}
