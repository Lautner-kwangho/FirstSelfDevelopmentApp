//
//  MyProfileAddVC+PhotoPicker+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/23.
//

import UIKit

extension MyProfileAddVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagepickerSetting() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        // 추후 phpicker 로 바꿀 예정
        
        addImage.image = UIImage(named: "클릭시 앨범")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openLibrary))
        addImage.addGestureRecognizer(tapGesture)
        addImage.isUserInteractionEnabled = true
    }
    
    @objc func openLibrary() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let value = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            addImage.image = value
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
