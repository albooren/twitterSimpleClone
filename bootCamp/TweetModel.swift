//
//  TweetModel.swift
//  bootCamp
//
//  Created by Cem Kazım on 20.01.2021.
//

import Foundation

struct TweetModel: Codable {
    
    let username: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case username
        case description
    }
}
