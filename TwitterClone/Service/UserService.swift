//
//  UserService.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-10-17.
//

import Firebase

struct UserService {
    
    func fetchUser(withUid uid: String) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                
                print("user data is \(data)")
            }
    }
}
