//
//  CalendarVC+CollectionView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit
import JTAppleCalendar

extension CalendarVC: JTACMonthViewDelegate, JTACMonthViewDataSource {
    // DataSource
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2021 01 01")!
        let endDate = formatter.date(from: "2099 12 31")!
        
        return ConfigurationParameters(startDate: startDate, endDate: endDate,calendar: Calendar.current, generateInDates: .forAllMonths, generateOutDates: .tillEndOfRow)
    }

    // Delegate
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        guard let cell = cell as? DateCell else {return}
//        cell.dateLabel.text = cellState.text
        configureCell(view: cell, cellState: cellState)
//        calendar.selectDates([Date()], keepSelectionIfMultiSelectionAllowed: true)
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        guard let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: DateCell.identifier, for: indexPath) as? DateCell else {
            return JTACDayCell()
        }
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        
//        if cellState.isSelected {
//            cell.dateLabel.textColor = .red
//        } else {
//            if cellState.dateBelongsTo == .thisMonth {
//                cell.dateLabel.textColor = .black
//            } else {
//                cell.dateLabel.textColor = .gray
//            }
//        }
        
        return cell
    }
    
    // 이걸로 공통 선언
    func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? DateCell else {return}
        cell.dateLabel.text = cellState.text
        handleCellTextColor(cell: cell, cellState: cellState)
        handleCellVisibility(cell: cell, cellState: cellState)
        handleCellSelection(cell: cell, cellState: cellState)
        handleCellEvent(cell: cell, cellState: cellState)
//        handleCellSelection(cell: cell, cellState: cellState)
    }
    
    //
    func handleCellTextColor(cell: DateCell, cellState: CellState) {
        let today = Date()
        
        let todayString = formatter.string(from: today)
        let monthDateString = formatter.string(from: cellState.date)
        
//        if todayString == monthDateString {
//            cell.dateLabel.textColor = .blue
//        } else {
//            cell.dateLabel.textColor = cellState.isSelected ? .black : .systemPink
//        }
    }
    
    func handleCellVisibility(cell: DateCell, cellState: CellState) {
        cell.isHidden = cellState.dateBelongsTo == .thisMonth ? false : true
    }
    
    func handleCellSelection(cell: DateCell, cellState: CellState) {
        cell.dateCustomVIew.isHidden = cellState.isSelected ? false : true
    }
    
    func handleCellEvent(cell: DateCell, cellState: CellState) {
//        var eventCompre = [String]()
//        for event in event {
//            formatter.dateFormat = "yyyy MM dd"
//            let date = formatter.date(from: event)
//            eventCompre.append(date)
//        }
        cell.dateEventLabel.isHidden = !event.contains { $0 == formatter.string(from: cellState.date)}
    }
    
    // 범위 색상지정 - 블로그 실컷 따라했는데 안됨 ㅡㅡ
//    func handleCellSelection(cell: JTACDayCell?, cellState: CellState) {
//        guard let customCell = view as? DateCell else {return}
//
//        for date in rangeDates {
//            if date.contains(cellState.date) {
//                customCell.backgroundColor = .green
//            }
//        }
//
//        switch cellState.selectedPosition() {
//        case .left:
//            customCell.contentView.layer.cornerRadius = customCell.frame.height / 2
//            customCell.contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
//            customCell.contentView.backgroundColor = .red
//        case .middle:
//            customCell.contentView.layer.cornerRadius = 0
//            customCell.contentView.layer.maskedCorners = []
//            customCell.contentView.backgroundColor = .orange
//        case .right:
//            customCell.contentView.layer.cornerRadius = customCell.frame.height / 2
//            customCell.contentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
//            // full : 한 cell이 left, right, middle 다 차지 할 때 (1cell = 1range)
//            customCell.contentView.backgroundColor = .yellow
//        case .full:
//            customCell.contentView.layer.cornerRadius = customCell.frame.height / 2
//            customCell.contentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
//            customCell.backgroundColor = .green
//        default: break
//        }
//
//        if !cellState.isSelected { customCell.contentView.backgroundColor = .white }
//    }
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
        
    }
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
        print(cellState)
    }
    
    // 내가 적은거 ! 이거 내 3시간 ㅜ
    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        let formatter = DateFormatter()
        let date = visibleDates.monthDates.first!.date
        formatter.dateFormat = "yyyy년 M월"
        calendarMonthTitle.text = formatter.string(from: date)
        print(visibleDates.monthDates)
        self.calendarCollectionView.reloadData()
    }
    
}
