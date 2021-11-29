//
//  MyProfileCollectionViewCell.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/20.
//

import UIKit

class MyProfileCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyProfileCollectionViewCell"
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myDate.adjustsFontSizeToFitWidth = true
        myDate.sizeToFit()
    }

}
