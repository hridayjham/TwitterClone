//
//  ExploreViewModel.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2023-01-12.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedSearchText = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedSearchText) ||
                $0.fullname.lowercased().contains(lowercasedSearchText)
            })
        }
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users: \(users)")
        }
    }
}
