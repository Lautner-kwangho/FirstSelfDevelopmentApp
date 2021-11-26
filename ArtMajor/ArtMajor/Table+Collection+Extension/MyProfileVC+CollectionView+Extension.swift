//
//  MyProfileVC+CollectionView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/20.
//

import UIKit

extension MyProfileVC {
    func myProfileCollectionViewSetting() {
        myProfileCollectionView.delegate = self
        myProfileCollectionView.dataSource = self
        
        let myProfileCollectionViewLayout = UICollectionViewFlowLayout()
        let spacing: CGFloat = UIScreen.main.bounds.width * 0.1
        let width = UIScreen.main.bounds.width * 0.5
        myProfileCollectionViewLayout.itemSize = CGSize(width: width, height: myProfileCollectionView.frame.size.height)
        myProfileCollectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        myProfileCollectionViewLayout.scrollDirection = .horizontal
        myProfileCollectionView.collectionViewLayout = myProfileCollectionViewLayout
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let nibName = UINib(nibName: MyProfileCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: MyProfileCollectionViewCell.identifier)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyProfileCollectionViewCell.identifier, for: indexPath) as? MyProfileCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "SharePost", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: SharePostVC.identifier) as! SharePostVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
