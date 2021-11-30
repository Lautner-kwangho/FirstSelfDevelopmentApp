//
//  CalendarVC+TableView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/19.
//

import UIKit

extension CalendarVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nibName = UINib(nibName: CalendarTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: CalendarTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as? CalendarTableViewCell else {
            return UITableViewCell()
        }
        
        let data = favoriteTasks[indexPath.row]
        
        cell.calendarImage.kingfishser(data.imageURL)
        cell.calendarTitle.text = data.title
        cell.calendarDate.text = data.dateTo + " ~ " + data.dateFrom
        
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let row = favoriteTasks[indexPath.row]
        self.event.remove(row.dateFrom.replacingOccurrences(of: ".", with: ""))
        try! localRealm.write {
            localRealm.delete(row)
            if favoriteTasks.isEmpty {
                setNoDataPlaceholder("정보가 없어요\n전시 화면에서 즐겨찾기를 선택해주세요", tableView: calendarTableView)
            } else {
                self.calendarTableView.backgroundView?.isHidden = true
            }
            tableView.reloadData()
        }
        self.calendarCollectionView.reloadData()
    }
}
