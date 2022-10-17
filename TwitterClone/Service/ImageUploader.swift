//
//  ImageUploader.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-09-21.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        if imageData == nil {
            print("DEBUG: Imagedata is nil")
        }
        
        
        ref.putData(imageData, metadata: nil) { metadata, error in
            if error != nil || metadata == nil {
                print("DEBUG: Failed to upload image with error: \(error!.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
