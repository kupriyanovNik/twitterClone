//
//  ViewModel.swift
//  Plant
//
//  Created by Никита Куприянов on 13.03.2023.
//

import Foundation
import SwiftUI

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case likes
    
    var title: String {
        switch self {
            case .tweets: return "Tweets"
            case .likes: return "Likes"
        }
    }
}
