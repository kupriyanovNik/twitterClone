//
//  ImageUploader.swift
//  Plant
//
//  Created by Никита Куприянов on 21.03.2023.
//

import FirebaseStorage
import UIKit


struct ImageUploader {
    static func uploadImage( image: UIImage, completon: @escaping(String) -> Void ) {
        // TODO: compressionQuality 0 -> 0.5 for better compression
        guard let imageData = image.jpegData(compressionQuality: 0) else { return }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error {
                print("error put data: \(error.localizedDescription)")
                return
            }
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completon(imageUrl)
            }
        }
    }
}
