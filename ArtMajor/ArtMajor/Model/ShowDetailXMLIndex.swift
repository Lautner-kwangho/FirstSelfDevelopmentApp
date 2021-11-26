//
//  ShowXMLManager.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import Foundation
import SWXMLHash

struct ShowDetailXML: XMLIndexerDeserializable {
    let showCode: String
    let showName: String
    let from: String
    let to: String
    let place: String
    let openRun: String
    let mainPoster: String
    let cast: String
    let runtime: String
    let age: String
    let price: String
    let genre: String
    let postZip: [String]
    let performaceTime: String
    
    static func deserialize(_ xml: XMLIndexer) throws -> ShowDetailXML {
        return try ShowDetailXML (
            showCode: xml["mt20id"].value(),
            showName: xml["prfnm"].value(),
            from: xml["prfpdfrom"].value(),
            to: xml["prfpdto"].value(),
            place: xml["fcltynm"].value(),
            openRun: xml["openrun"].value(),
            
            mainPoster: xml["poster"].value(),
            cast: xml["prfcast"].value(),//출현
            runtime: xml["prfruntime"].value(),
            age: xml["prfage"].value(),
            price: xml["pcseguidance"].value(),
            genre: xml["genrenm"].value(),
            postZip: xml["styurls"]["styurl"].value(), // 배열
            performaceTime: xml["dtguidance"].value()
            
        )
    }
}
