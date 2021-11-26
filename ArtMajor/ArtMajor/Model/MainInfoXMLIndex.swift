//
//  MainInfoXMLIndex.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/25.
//

import Foundation
import SWXMLHash

struct MainInfoXML: XMLIndexerDeserializable {
    let price: String
    let phone: String
    
    static func deserialize(_ xml: XMLIndexer) throws -> MainInfoXML {
        return try MainInfoXML (
            price: xml["price"].value(),
            phone: xml["phone"].value()
        )
    }
}

