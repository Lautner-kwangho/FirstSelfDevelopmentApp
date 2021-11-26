//
//  ShowVC+API+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import UIKit
import Alamofire
import SWXMLHash

extension ShowVC {
 
    func showApi() {
        let datefomatter = DateFormatter()
        datefomatter.dateFormat = "yyyyMMdd"
        datefomatter.locale = Locale(identifier: "ko_KR")
        let today = datefomatter.string(from: Date())
        
        let nextYear = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        let nextYearDay = datefomatter.string(from: nextYear!)
        
        ShowAPIManager.shared.showAPI(startDate: "\(today)", endDate: "\(nextYearDay)", shcate: "AAAA", signgucode: "11") { xml in
            do {
                let showXMLData: [ShowXML] = try xml["dbs"]["db"].value()
                self.showXML = showXMLData
            } catch {
                print(error)
            }
            self.showTableView.reloadData()
        }
    }
    
}
