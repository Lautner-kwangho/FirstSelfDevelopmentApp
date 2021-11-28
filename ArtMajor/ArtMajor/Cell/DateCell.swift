//
//  DateCell.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit
import JTAppleCalendar

class DateCell: JTACDayCell {
    static let identifier = "dateCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateEventLabel: UILabel!
    @IBOutlet weak var dateCustomVIew: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        dateEventLabel.adjustsFontSizeToFitWidth = true
        dateEventLabel.sizeToFit()
        
        dateCustomVIew.layer.cornerRadius = self.dateCustomVIew.frame.width / 3
//        dateLabel.textColor = .black
    }
    
}
