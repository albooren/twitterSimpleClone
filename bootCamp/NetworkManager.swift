//
//  NetworkManager.swift
//  bootCamp
//
//  Created by Cem Kazım on 20.01.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    let url = "https://demo2033218.mockable.io/"
    
    private init() {
        // codes...
    }
    
    func getTweetFrom(completion: @escaping (TweetList) -> ()) {
        AF.request(url, method: .get, encoding: URLEncoding.default).response { (response) in
            guard let data = response.data else { return }
            do {
                let tweetList = try JSONDecoder().decode(TweetList.self, from: data)
                completion(tweetList)
            } catch let error {
                print(error)
            }
        }
    }
}
