//
//  UploadViewModel.swift
//  Plant
//
//  Created by Никита Куприянов on 25.03.2023.
//

import SwiftUI

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet: Bool = false
    let service = TweetService()
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                
            }
        }
    }
}

