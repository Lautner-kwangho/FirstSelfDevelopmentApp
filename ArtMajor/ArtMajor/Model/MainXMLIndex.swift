//
//  MainXMLIndex.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/24.
//

import Foundation
import SWXMLHash

struct MainXML: XMLIndexerDeserializable {
    let seq: String
    let title: String
    let startDate: String
    let endDate: String
    let place: String
    let realmName: String
    let area: String
    let posterImage: String
    let gpsX: String
    let gpsY: String
    
    // 와 이건 진짜 codable처럼 대박이네;
    static func deserialize(_ xml: XMLIndexer) throws -> MainXML {
        return try MainXML (            
            seq: xml["seq"].value(),
            title: xml["title"].value(),
            startDate: xml["startDate"].value(),
            endDate: xml["endDate"].value(),
            place: xml["place"].value(),
            realmName: xml["realmName"].value(),
            area: xml["area"].value(),
            posterImage: xml["thumbnail"].value(),
            gpsX: xml["gpsX"].value(),
            gpsY: xml["gpsY"].value()
        )
    }
}
