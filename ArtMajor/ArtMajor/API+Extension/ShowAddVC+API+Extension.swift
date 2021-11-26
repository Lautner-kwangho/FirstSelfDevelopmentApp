//
//  ShowAddVC+API+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import UIKit
import Alamofire
import SWXMLHash

extension ShowAddVC {
    
    func showDetailApi(showCode: String) {
        hud.show(in: self.view, animated: true)
        hud.progress = 0.1
        hud.style = .extraLight
        ShowAPIManager.shared.showDetailAPI(showCode: showCode) { xml in
            do {
                let showDetailXMLData: [ShowDetailXML] = try xml["dbs"]["db"].value()
                self.showDetailXML = showDetailXMLData
                self.hud.dismiss()
            } catch {
                print(error)
            }
            
        }
    }
    
}
