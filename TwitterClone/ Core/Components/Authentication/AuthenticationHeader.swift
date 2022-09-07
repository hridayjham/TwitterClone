//
//  AuthenticationHeader.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-09-07.
//

import SwiftUI

struct AuthenticationHeader: View {
    let upperText: String
    let lowerText: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            
            Text(upperText)
                .font(.largeTitle)
                .fontWeight(.semibold)
           
            Text(lowerText)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthenticationHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeader(upperText: "Get started.", lowerText: "Create your account")
    }
}
