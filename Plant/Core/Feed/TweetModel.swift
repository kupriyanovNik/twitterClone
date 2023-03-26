//
//  TweetModel.swift
//  Plant
//
//  Created by Никита Куприянов on 25.03.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int = 0
    
    var user: User?
    var didLike: Bool? = false
}
