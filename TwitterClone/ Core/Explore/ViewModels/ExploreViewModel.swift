//
//  ExploreViewModel.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2023-01-12.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users: \(users)")
        }
    }
}
