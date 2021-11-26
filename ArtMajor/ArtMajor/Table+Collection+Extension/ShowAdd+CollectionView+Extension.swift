//
//  ShowAdd+CollectionView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

extension ShowAddVC: UICollectionViewDelegateFlowLayout {
    
    
    func showAddCollectionViewSetting() {
        showAddCollectionView.delegate = self
        showAddCollectionView.dataSource = self
        
        let showAddCollectionViewLayout = UICollectionViewFlowLayout()
        showAddCollectionViewLayout.itemSize = CGSize(width: self.view.frame.size.width, height: showAddCollectionView.frame.size.height)
        showAddCollectionViewLayout.scrollDirection = .horizontal
        
        showAddCollectionView.collectionViewLayout = showAddCollectionViewLayout
        
        showAddCollectionView.decelerationRate = .fast
        showAddCollectionView.isPagingEnabled = true

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let itemCount = showDetailXML.first?.postZip.count else {
            return 1
        }
        return itemCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let nibName = UINib(nibName: ShowAddCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: ShowAddCollectionViewCell.identifier)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowAddCollectionViewCell.identifier, for: indexPath) as? ShowAddCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let xml = showDetailXML.first?.postZip[indexPath.item] {
            print(xml)
            cell.showAddPoster.kingfishser(xml)
        }
        cell.showAddOringButton.addTarget(self, action: #selector(goToOriginPoster), for: .touchUpInside)
        return cell
    }
    
    @objc func goToOriginPoster() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ShowOriginPosterVC.identifier) as! ShowOriginPosterVC

        present(vc, animated: true, completion: nil)
    }
}
