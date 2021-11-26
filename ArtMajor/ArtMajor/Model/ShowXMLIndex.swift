//
//  ShowXMLIndex.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import Foundation
import SWXMLHash

struct ShowXML: XMLIndexerDeserializable {
    let showCode: String
    let showName: String
    let from: String
    let to: String
    let place: String
    let showPoster: String
    let showState: String
    let openRun: String
    
    static func deserialize(_ xml: XMLIndexer) throws -> ShowXML {
        return try ShowXML (
            showCode: xml["mt20id"].value(),
            showName: xml["prfnm"].value(),
            from: xml["prfpdfrom"].value(),
            to: xml["prfpdto"].value(),
            place: xml["fcltynm"].value(),
            showPoster: xml["poster"].value(),
            showState: xml["prfstate"].value(),
            openRun: xml["openrun"].value()
        )
    }
}
