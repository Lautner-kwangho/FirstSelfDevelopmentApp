//
//  MainInfo+Realm+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/28.
//

import UIKit
import Toast

extension MainInfoVC {
    func mainInfoRealm() {
        self.mainInfoFavoriteButton.addTarget(self, action: #selector(saveFavorite), for: .touchUpInside)
    }
    
    @objc func saveFavorite() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let formatStartDate = formatter.date(from: mainData.startDate)!
        let formatEndDate = formatter.date(from: mainData.endDate)!
        
        formatter.dateFormat = "yyyy. MM. dd"
        let start = formatter.string(from: formatStartDate)
        let end = formatter.string(from: formatEndDate)
        
        let titleFilter = mainData.title.replacingOccurrences(of: "&gt;", with: ">").replacingOccurrences(of: "&quot;", with: "\"").replacingOccurrences(of: "&amp;", with: "&").replacingOccurrences(of: "&apos;", with: "'").replacingOccurrences(of: "&lt;", with: "<")
        
        let saveData = FavoriteRealm(title: titleFilter, dateTo: start, dateFom: end, imageURL: mainData.posterImage, favorite: false)
        
        if localRealm.objects(FavoriteRealm.self).filter("title == '\(titleFilter)'").isEmpty {
            self.view.makeToast("저장되었습니다", duration: 1, position: .center)
            try! self.localRealm.write {
                self.localRealm.add(saveData)
            }
        } else {
            let selectRealm = favoriteTasks.filter("title == '\(titleFilter)'").first!
            try! self.localRealm.write {
                selectRealm.favorite = !selectRealm.favorite
                // 일단 나중에 출시할 때 
//                if selectRealm.favorite == false {
//                    self.view.makeToast("해제되었습니다", duration: 1, position: .center)
//                } else {
//                    self.view.makeToast("추가되었습니다", duration: 1, position: .center)
//                }
                
//                switch selectRealm.favorite {
//                case false: self.view.makeToast("해제되었습니다", duration: 1, position: .center)
//                case true: self.view.makeToast("추가되었습니다", duration: 1, position: .center)
//                }
            }
        }
        
    }
}
