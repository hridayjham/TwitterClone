//
//  UserRowView.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-08-09.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("OscarPiastri")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Oscar Piastri")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
