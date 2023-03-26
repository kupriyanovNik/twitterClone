//
//  User.swift
//  Plant
//
//  Created by Никита Куприянов on 23.03.2023.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id
    }
}
