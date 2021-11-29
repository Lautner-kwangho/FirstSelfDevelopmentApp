//
//  ShowAddCollectionViewCell.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

protocol height {
    func height(size: CGFloat)
}

class ShowAddCollectionViewCell: UICollectionViewCell {
    static let identifier = "ShowAddCollectionViewCell"
    
    @IBOutlet weak var showAddPoster: UIImageView!
    @IBOutlet weak var showAddOringButton: UIButton!
    
    var imageHeight: NSLayoutConstraint?
    var delegate: height?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let width = self.showAddPoster.constraints.first?.constant {
            let viewWidth = UIScreen.main.bounds.width
            let viewHieght = UIScreen.main.bounds.height
            
            let imageHeight = ( viewHieght * width ) / viewWidth
//            print(imageHeight)
            
            let myFloat = NSNumber.init(value: imageHeight).floatValue
            let myCGFloat = CGFloat(myFloat)
            self.delegate?.height(size: myCGFloat)
        }
    }

}
