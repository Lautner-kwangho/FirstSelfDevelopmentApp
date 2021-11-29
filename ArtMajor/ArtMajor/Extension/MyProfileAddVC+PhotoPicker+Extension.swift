//
//  MyProfileAddVC+PhotoPicker+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/23.
//

import UIKit
import Photos

extension MyProfileAddVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagepickerSetting() {
        imagePicker.delegate = self
        // 추후 phpicker 로 바꿀 예정
        
        addImage.image = UIImage(named: "클릭시 앨범")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openLibrary))
        addImage.addGestureRecognizer(tapGesture)
        addImage.isUserInteractionEnabled = true
    }
    
    @objc func openLibrary() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .notDetermined:
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                present(imagePicker, animated: false, completion: nil)
            }
            // 아직 거부중
        case .restricted:
            self.alert(title: "제한 접근", message: "사용자님의 사진 접근 권한이 거부되어 있습니다", actionTitle: "확인")
        case .denied:
            self.alert(title: "거부", message: "사진 접근 권한이 거부되었습니다. 권한을 허용해주세요", actionTitle: "확인")
        case .authorized:
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                present(imagePicker, animated: false, completion: nil)
            }
        case .limited:
            self.alert(title: "제한", message: "제한된 접근법입니다", actionTitle: "확인")
        @unknown default:
            print("DEFAULT ERROR")
        }
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
