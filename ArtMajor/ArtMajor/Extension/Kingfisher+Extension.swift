//
//  Kingfisher+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    func kingfishser(_ url: String) {
        kf.indicatorType = .activity
        let url = URL(string: url)
        self.kf.setImage(with: url, options: [.scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .cacheOriginalImage]) { Result in
            switch Result {
            case .failure(let error):
                self.backgroundColor = .gray
            case .success(_):
                self.kf.setImage(with: url)
            }
        }
    }
}
