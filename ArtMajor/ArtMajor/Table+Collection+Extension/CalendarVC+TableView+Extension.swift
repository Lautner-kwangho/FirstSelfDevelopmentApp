//
//  CalendarVC+TableView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/19.
//

import UIKit

extension CalendarVC {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nibName = UINib(nibName: CalendarTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: CalendarTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as? CalendarTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}
