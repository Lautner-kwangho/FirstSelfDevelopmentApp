//
//  FavoriteRealm.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/27.
//

import Foundation
import RealmSwift

class FavoriteRealm: Object {
    
    @Persisted var title: String
    @Persisted var dateTo: String
    @Persisted var dateFrom: String
    @Persisted var imageURL: String
    @Persisted var favorite: Bool
    @Persisted(primaryKey: true) var _id: ObjectId
    
    convenience init(title: String, dateTo: String, dateFom: String, imageURL: String, favorite: Bool ) {
        self.init()
        self.title = title
        self.dateTo = dateTo
        self.dateFrom = dateFom
        self.imageURL = imageURL
        self.favorite = favorite
    }
    
}
