//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-08-07.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ProfilePhotoSelectorView()
            }
            .environmentObject(viewModel)
        }
    }
}
