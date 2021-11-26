//
//  ShowAPIManager.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import Alamofire
import SWXMLHash
import Foundation

class ShowAPIManager {
    
    static let shared = ShowAPIManager()
    
    func showAPI(startDate: String, endDate: String, shcate: String, signgucode: String, result: @escaping (XMLIndexer) -> ()) {
        
        guard let shcated = shcate.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let signgucoded = signgucode.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        let url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=\(APIKEY.kopisKey)&stdate=\(startDate)&eddate=\(endDate)&cpage=1&rows=1000&shcate=\(shcated)&signgucode=\(signgucoded)"
        // shcate=AAAA, signgucode=11

        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let xml = XMLHash.config { config in
                    config.shouldProcessLazily = true
                }.parse(value)
                result(xml)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showDetailAPI(showCode: String, result: @escaping(XMLIndexer) -> () ) {
        let url = "http://www.kopis.or.kr/openApi/restful/pblprfr/\(showCode)?service=\(APIKEY.kopisKey)"
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let xml = XMLHash.config { config in
                    config.shouldProcessLazily = true
                }.parse(value)
                result(xml)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
