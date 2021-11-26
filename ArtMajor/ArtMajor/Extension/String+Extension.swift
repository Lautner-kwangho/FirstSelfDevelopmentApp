//
//  String+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import Foundation

extension String {
    init?(htmlEncoding: String) {
        guard let data = htmlEncoding.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        
        self.init(attributedString.string)
    }


}
