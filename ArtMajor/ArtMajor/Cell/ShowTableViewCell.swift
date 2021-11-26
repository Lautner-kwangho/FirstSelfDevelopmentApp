//
//  ShowTableViewCell.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    static let identifier = "ShowTableViewCell"
    
    @IBOutlet weak var showView: UIView!
    @IBOutlet weak var showImage: UIImageView!
    
    @IBOutlet weak var showTitle: UILabel!
    @IBOutlet weak var showDate: UILabel!
    @IBOutlet weak var showPlace: UILabel!
    @IBOutlet weak var showOpenRun: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        showView.clipsToBounds = true
        showView.layer.cornerRadius = self.frame.height * 0.05
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
