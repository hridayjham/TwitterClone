//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-09-08.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        self.fetchUser()
    }
    
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to login with error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to register with error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            //self.userSession = user
            
            self.tempUserSession = user
            
            print("DEBUG: registered user succesfully")
            print("DEBUG: user is \(self.userSession)")
            
            let data = ["email": email,
                        "password": password,
                        "username": username.lowercased(),
                        "fullname": fullname]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
        
        
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _  in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let userId = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: userId) { user in
            self.currentUser = user
        }
    }
    
    
    
}
