//
//  MyprofileAddVC+FileManager+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/29.
//

import UIKit

extension UIViewController {
    
    func saveImageToDocumentDirectory(imageName: String, image: UIImage) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let imageURL = documentDirectory.appendingPathComponent(imageName)
        
        guard let data = image.jpegData(compressionQuality: 0.5) else {return}
        
        if FileManager.default.fileExists(atPath: imageURL.path) {
            do {
                try FileManager.default.removeItem(at: imageURL)
                alert(title: "중복 제거", message: "삭제되었습니다", actionTitle: "확인")
            } catch {
                alert(title: "에러", message: "사진을 삭제하지 못했습니다", actionTitle: "확인")
            }
        }
        
        do {
            try data.write(to: imageURL)
        } catch {
            alert(title: "에러", message: "사진을 저장하지 못하였습니다", actionTitle: "확인")
        }
        
    }
    
    // DocumentImageDelete
    func deleteImageFromDocumentDirectory(imageName: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let imageURL = documentDirectory.appendingPathComponent(imageName)
        
        if FileManager.default.fileExists(atPath: imageURL.path) {
            do {
                try FileManager.default.removeItem(at: imageURL)
            } catch {
                alert(title: "오류", message: "디바이스에서 사진을 삭제하지 못했습니다", actionTitle: "확인")
            }
        }
    }
    
    // 이미지 로드
    func loadImageFromDocumentDirectory(imageName: String) -> UIImage? {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        if let directoryPath = path.first {
            let imageURL = URL(fileURLWithPath: directoryPath).appendingPathComponent(imageName)
            return UIImage(contentsOfFile: imageURL.path)
        } else {
            return nil
        }
    }
}
