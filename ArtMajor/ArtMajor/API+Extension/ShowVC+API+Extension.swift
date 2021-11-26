//
//  ShowVC+API+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import UIKit
import Alamofire
import SWXMLHash
import JGProgressHUD

extension ShowVC {
 
    func showApi(local: String) {
        hud.show(in: self.view, animated: true)
        hud.progress = 0.1
        hud.style = .extraLight

        let datefomatter = DateFormatter()
        datefomatter.dateFormat = "yyyyMMdd"
        datefomatter.locale = Locale(identifier: "ko_KR")
        let today = datefomatter.string(from: Date())
        
        let nextYear = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        let nextYearDay = datefomatter.string(from: nextYear!)
        
        ShowAPIManager.shared.showAPI(startDate: "\(today)", endDate: "\(nextYearDay)", shcate: "", signgucode: local) { xml in
            self.selectGerne.setTitle("전체", for: .normal)
            self.selectGerne.isHidden = true
            do {
                let showXMLData: [ShowXML] = try xml["dbs"]["db"].value()
                self.showXML = showXMLData
                self.showTableView.reloadData()
                self.selectGerne.isHidden = false
            } catch {
                print(error)
                self.showXML = []
                self.alert(title: "다른 지역을 선택해주세요", message: "현재 진행중인 공연이 없습니다.", actionTitle: "확인")
                
                self.setNoDataPlaceholder("정보가 없어요\n다른 선택지를 선택해주세요", tableView: self.showTableView)
                
                self.selectGerne.isHidden = true
                self.showTableView.reloadData()
            }
            self.hud.dismiss()
        }
    }
    
}
