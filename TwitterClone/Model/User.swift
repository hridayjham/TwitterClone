//
//  User.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-10-17.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable  {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    
}
