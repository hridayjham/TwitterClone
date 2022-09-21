//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-09-14.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoSelectorView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var profileImage: Image?
    var body: some View {
        VStack {
            AuthenticationHeader(upperText: "Setup account", lowerText: "Select a profile picture.")
            
            
            PhotosPicker(selection: $selectedItem,
                         matching: .images,
                         photoLibrary: .shared()){
                if let selectedImageData,
                   let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    
                    VStack {
                        
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color(.systemBlue))
                            .font(.system(size: 25))
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                            .padding(.top, 12)
                            .padding(.bottom, 12)
                        
                        Text("Photo")
                            .foregroundColor(Color(.systemBlue))
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .padding(.top, 12)
                    }
                    .frame(width: 180, height: 180)
                    .padding()
                    .overlay(
                        Circle()
                            .stroke(Color(.systemBlue), lineWidth: 4)
                            .font(.system(size: 25))
                    )
                }
            }
                         .padding(.top, 44)
                         .onChange(of: selectedItem) { newItem in
                             Task {
                                 // Retrieve selected asset in the form of Data
                                 if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                     selectedImageData = data
                                 }
                             }
                         }
            
            if selectedImageData != nil {
                Button {
                    print("DEBUG: Finish registering user")
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                .padding(.top, 32)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedItem  = selectedItem else { return }
        profileImage = Image(uiImage: UIImage(data: selectedImageData!)!)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}


