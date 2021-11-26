//
//  MainInfoVC+API+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/25.
//

import UIKit
import Alamofire
import SWXMLHash

extension MainInfoVC {
    
    func mainInfoApi(seq: String) {
        MainAPIManager.shared.mainInfoCultureAPI(seq: seq) { xml in
            do {
                let mainInfoXMLData: [MainInfoXML] = try xml["response"]["msgBody"]["perforInfo"].value()
                self.infoData = mainInfoXMLData
            } catch {
                print(error)
            }
        }
        
    }
}
