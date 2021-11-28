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
    
}
