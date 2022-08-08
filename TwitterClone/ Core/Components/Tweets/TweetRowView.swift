//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-08-07.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            //profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                VStack(alignment: .leading, spacing: 4  ) {
                    
                    //User info & tweet caption
                    HStack {
                        Text("Oscar Piastri")
                            .font(.subheadline).bold()
                        
                        Text("@OscarPiastri")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("3d")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    
                    //tweet caption
                    Text("I understand that without my agreement, Apline F1 have put out a press release late this afternoon that I am driving for them next year. This is wrong and I have not signed a contract with Alpine for 2023. I will not be driving for them next year.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            
            }
            
            //action buttons
            HStack {
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
