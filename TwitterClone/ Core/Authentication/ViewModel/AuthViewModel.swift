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
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: user session is \(self.userSession?.uid)")
    }
    
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to login with error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: logged in user succesfully")
            print("DEBUG: user is \(self.userSession)")
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
    
    
    
}
