//
//  TweetRowViewModel.swift
//  Plant
//
//  Created by Никита Куприянов on 26.03.2023.
//

import SwiftUI

class TweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.checkIfUserLikedTweet()        
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            withAnimation {
                self.tweet.didLike = true
            }
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            withAnimation {
                self.tweet.didLike = false 
            }
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                withAnimation(.linear) {
                    self.tweet.didLike = true
                }
            }
        }
    }
}
