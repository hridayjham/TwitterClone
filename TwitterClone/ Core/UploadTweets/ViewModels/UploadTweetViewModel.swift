//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2023-01-13.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                // show error message
            }
        }
        
    }
}
