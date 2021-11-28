//
//  CalendarTableViewCell.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/19.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    static let identifier = "CalendarTableViewCell"
    
    @IBOutlet weak var calendarImage: UIImageView!
    @IBOutlet weak var calendarTitle: UILabel!
    @IBOutlet weak var calendarDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
