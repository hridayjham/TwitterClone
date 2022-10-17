//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-08-08.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 25, id: \.self) { _ in
                        NavigationLink {
                            //ProfileView()
                        } label: {
                            UserRowView()
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
