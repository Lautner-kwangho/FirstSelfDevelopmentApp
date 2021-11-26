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
        let formatter = DateFormatter()
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
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        guard let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: DateCell.identifier, for: indexPath) as? DateCell else {
            return JTACDayCell()
        }
//        cell.dateLabel.text = cellState.text
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        
        return cell
    }
    
    // 해당 달만
    func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? DateCell else {return}
        cell.dateLabel.text = cellState.text
        handleCellTextColor(cell: cell, cellState: cellState)
    }
    
    func handleCellTextColor(cell: DateCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.isHidden = false
            if cellState.isSelected {
                cell.dateLabel.textColor = .orange
            } else {
                cell.dateLabel.textColor = .black
            }
        } else {
            cell.isHidden = true
        }
    }
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    // 내가 적은거 ! 이거 내 3시간 ㅜ
    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        let formatter = DateFormatter()
        let date = visibleDates.monthDates.first!.date
        formatter.dateFormat = "yyyy년 M월"
        calendarMonthTitle.text = formatter.string(from: date)
    }
    
}
