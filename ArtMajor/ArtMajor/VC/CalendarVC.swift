//
//  CalendarVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit
import JTAppleCalendar
import RealmSwift

class CalendarVC: UIViewController {

    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var calendarCollectionView: JTACMonthView!
    
    @IBOutlet weak var calendarHeaderView: UIView!
    @IBOutlet weak var calendarMonthTitle: UILabel!
    
    @IBOutlet weak var calendarCustomView: UIView!
    @IBOutlet weak var calendarTableView: UITableView!
    let formatter = DateFormatter()
    
    var localRealm = try! Realm()
    var favoriteTasks: Results<FavoriteRealm>!
    var event = Set<String>()
    
    // 더미데이터
//    var myPageData = ([
//        (property: 0, date: ["2021-08-02"]),
//        (property: 0, date: ["2021-08-04", "2021-08-05", "2021-08-06", "2021-08-07"]),
//        (property: 2, date: ["2021-08-09", "2021-08-10", "2021-08-11", "2021-08-12", "2021-08-13", "2021-08-14", "2021-08-15"]),
//        (property: 3, date: ["2021-08-22"]),
//        (property: 6, date: ["2021-08-24", "2021-08-25", "2021-08-26", "2021-08-27"])
//    ])
//    var rangeDates: [[Date]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarSetting()
//        calendarState()
        
//        DispatchQueue.global().asyncAfter(deadline: .now()) {
//            let serverObjects = self.getEvents()
//            for (date, event) in serverObjects {
//                let stringData = self.formatter.string(from: date)
//                self.eventServer[stringData] = event
//            }
//            DispatchQueue.main.async {
//                self.calendarCollectionView.reloadData()
//            }
//        }
        
        favoriteTasks = localRealm.objects(FavoriteRealm.self)
        calendarTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calendarTableView.reloadData()
        calendarCollectionView.reloadData()

        if favoriteTasks.isEmpty {
            setNoDataPlaceholder("정보가 없어요\n홈 화면에서 즐겨찾기를 선택해주세요", tableView: calendarTableView)
        } else {
            self.calendarTableView.backgroundView?.isHidden = true
        }

        if !favoriteTasks.isEmpty {
            favoriteTasks.forEach { event.insert($0.dateFrom.replacingOccurrences(of: ".", with: "")) }
            self.calendarCollectionView.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        calendarTableView.reloadData()
        calendarCollectionView.reloadData()
    }

}
