//
//  TweetFilterViewModel.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-08-09.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
