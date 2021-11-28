//
//  Calendar+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/28.
//

import UIKit

extension CalendarVC {
    
    func calendarSetting() {
        
        calendarCollectionView.ibCalendarDelegate = self
        calendarCollectionView.ibCalendarDataSource = self
        
        calendarCollectionView.minimumLineSpacing = 0
        calendarCollectionView.minimumInteritemSpacing = 0
        calendarCollectionView.scrollToDate(Date(),animateScroll: false)
        
        
        calendarCollectionView.selectDates([Date()])
//        formatter.dateFormat = "yyyy.MM.dd"
//        let a = formatter.date(from: "2021.11.10")!
//        let b = formatter.date(from: "2021.11.30")!
//        calendarCollectionView.selectDates(from: a,to: b)
        
//        calendarCollectionView.allowsMultipleSelection = true
//        calendarCollectionView.allowsRangedSelection = true
        
        calendarTableView.delegate = self
        calendarTableView.dataSource = self
        
    }
    
//    func getEvents() -> [Date:String] {
//        formatter.dateFormat = "yyyy MM dd"
//
//        return [
//            formatter.date(from: "2021 11 01")!:"happayDay",
//            formatter.date(from: "2021 11 10")!:"hapdgwerhpayDay",
//            formatter.date(from: "2021 11 30")!:"happayDaygfsdffggsfg",
//        ]
//    }
    
    // 아 ;;
//    func calendarState() {
//        guard let calendar = NSCalendar(calendarIdentifier: .gregorian) else {return}
//        
//        for i in myPageData {
//            var rangDate: [Date] = []
//            for u in i.date {
//                let dateArray = u.split(separator: "-").map {Int($0)}
//                let dateComponent = DateComponents(year: dateArray[0], month: dateArray[1], day: dateArray[2])
//                let date = calendar.date(from: dateComponent as DateComponents)!
//                rangDate.append(date)
//            }
//            self.rangeDates.append(rangDate)
//        }
//    }
    
}
