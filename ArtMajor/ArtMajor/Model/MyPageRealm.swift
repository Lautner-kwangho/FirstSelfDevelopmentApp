//
//  MyPageRealm.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/28.
//

import Foundation
import RealmSwift

class MyPageRealm: Object {
    
    @Persisted var title: String?
    @Persisted var genre: String
    @Persisted var date: String
    @Persisted var content: String?
    @Persisted(primaryKey: true) var _id: ObjectId
    
    convenience init(title: String?,
                     genre: String,
                     date: String,
                     content: String? ) {
        self.init()
        self.title = title
        self.genre = genre
        self.date = date
        self.content = content
    }
    
}
