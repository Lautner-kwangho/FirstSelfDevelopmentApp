//
//  MainCollectionViewCell.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/19.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    
    @IBOutlet weak var mainCollectionView: UIView!
    @IBOutlet weak var mainCollectionBackgroundBlur: UIImageView!
    @IBOutlet weak var mainCollectionPosterImage: UIImageView!
    @IBOutlet weak var mainCollectionFavoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainCollectionView.clipsToBounds = true
        mainCollectionView.layer.cornerRadius = self.frame.size.height * 0.05
    }

}
