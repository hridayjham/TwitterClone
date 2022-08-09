//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-08-09.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("201").bold()
                    .font(.subheadline)
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4) {
                Text("207.3K").bold()
                    .font(.subheadline)
                    
                Text("Followers")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
