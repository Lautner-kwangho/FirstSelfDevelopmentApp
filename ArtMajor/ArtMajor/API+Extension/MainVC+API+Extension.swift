//
//  MainVC+API+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit
import Alamofire
import SWXMLHash

extension MainVC {
    
    func apiTest(place: String) {

        let datefomatter = DateFormatter()
        datefomatter.dateFormat = "yyyyMMdd"
        datefomatter.locale = Locale(identifier: "ko_KR")
        let today = datefomatter.string(from: Date())
        
        let nextYear = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        let nextYearDay = datefomatter.string(from: nextYear!)
        
        MainAPIManager.shared.mainCultureAPI(type: "realm", sort: "1", place: place, realmtype: "D000", fromDay: "\(today)", ToDay: "\(nextYearDay)") { xml in
            do {
                if place == "" {
                    let mainXMLData: [MainXML] = try xml["response"]["msgBody"]["perforList"].value()
                    self.mainXML = mainXMLData
                } else {
                    let mainXMLData: [MainXML] = try xml["response"]["msgBody"]["perforList"].value()
                    self.mainXMLFilter = mainXMLData
                    self.mainCollectionView.backgroundView?.isHidden = true
                }
            } catch {
                print(error)
                // 여기에 얼럿 띄어주기
                self.mainXMLFilter = []
                self.mainCollectionView.backgroundView?.isHidden = false
                self.alert(title: "다른 지역을 선택해주세요", message: "현재 진행중인 전시회가 없습니다.", actionTitle: "확인")
            }
            self.mainCollectionView.reloadData()
            
        }
        
        
        
    }
}
