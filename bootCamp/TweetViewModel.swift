//
//  TweetViewModel.swift
//  bootCamp
//
//  Created by Cem Kazım on 20.01.2021.
//

import Foundation

protocol TweetViewModelDelegate: class {
    func setTweet(_ tweets: [TweetModel])
}

class TweetViewModel {
    
    var tweets = [TweetModel]()
    weak var delegate: TweetViewModelDelegate?
    
    init() {
        getTweet()
    }
    
    func getTweet() {
        NetworkManager.shared.getTweetFrom(completion: { [weak self] (result) in
            guard let self = self else { return }
            self.delegate?.setTweet(result.tweets)
        })
    }
}
