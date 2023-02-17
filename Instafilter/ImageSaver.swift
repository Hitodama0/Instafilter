//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Biagio Ricci on 17/02/23.
//

import SwiftUI

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
    
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
}
