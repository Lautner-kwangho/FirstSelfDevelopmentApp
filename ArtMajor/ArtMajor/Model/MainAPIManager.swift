//
//  MainAPIManager.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import Alamofire
import SWXMLHash
import Foundation

class MainAPIManager {
    static let shared = MainAPIManager()
    
    func mainCultureAPI(type: String, sort: String, place: String, realmtype: String ,fromDay: String, ToDay: String, result: @escaping (XMLIndexer) -> ()) {
        // type area: 지역, period: 기간별, realm: 분야별, d/?: 상세조회
        // sort 1:등록일, 2:공연명, 3:지역
        // &realmCode=D000 : 미술 관련
        
        guard let placed = place.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/\(type)?serviceKey=\(APIKEY.publicDataKey)&sortStdr=\(sort)&sido=\(placed)&realmCode=\(realmtype)&rows=1000&from=\(fromDay)&to=\(ToDay)"
        
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
    
    func mainInfoCultureAPI(seq: String, result: @escaping (XMLIndexer) -> ()) {
        
        guard let seq = seq.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        let url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?serviceKey=\(APIKEY.publicDataKey)&seq=\(seq)"
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
