//
//  CalendarVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit
import JTAppleCalendar

class CalendarVC: UIViewController {

    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var calendarCollectionView: JTACMonthView!
    
    @IBOutlet weak var calendarHeaderView: UIView!
    @IBOutlet weak var calendarMonthTitle: UILabel!
    
    @IBOutlet weak var calendarTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarCollectionView.ibCalendarDelegate = self
        calendarCollectionView.ibCalendarDataSource = self
        
        calendarCollectionView.minimumLineSpacing = 0
        calendarCollectionView.minimumInteritemSpacing = 0
        calendarCollectionView.scrollToDate(Date(),animateScroll: false)
        
        calendarTableView.delegate = self
        calendarTableView.dataSource = self
    }

}
