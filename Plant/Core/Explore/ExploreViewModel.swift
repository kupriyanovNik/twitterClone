//
//  ExploreViewModel.swift
//  Plant
//
//  Created by Никита Куприянов on 24.03.2023.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var searchText: String = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    private let service = UserService()
    init() { fetchUsers() }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}

