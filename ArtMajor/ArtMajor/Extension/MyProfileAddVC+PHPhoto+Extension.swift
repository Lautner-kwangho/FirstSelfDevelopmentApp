//
//  MyProfileAddVC+PHPhoto+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/30.
//

import UIKit
import PhotosUI

extension MyProfileAddVC: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, Error in
                DispatchQueue.main.async {
//                    self.myImageView.image = image as? UIImage
                }
            }
        } else {
            //제공하지 않을 때 코드
        }
    }
}

