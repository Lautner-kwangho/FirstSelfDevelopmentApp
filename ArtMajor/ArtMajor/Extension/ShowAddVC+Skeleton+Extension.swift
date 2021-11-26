//
//  ShowAddVC+Skeleton+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import UIKit
import SkeletonView

extension ShowAddVC: SkeletonTableViewDelegate, SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "skeletonCell"
        // 이것도 나중에 하자...
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

}
