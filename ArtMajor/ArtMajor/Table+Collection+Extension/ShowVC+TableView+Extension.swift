//
//  ShowVC+TableView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

extension ShowVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showXML.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nibName = UINib(nibName: ShowTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: ShowTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowTableViewCell.identifier, for: indexPath) as? ShowTableViewCell else {
            return UITableViewCell()
        }
        let data = showXML[indexPath.row]
        
        cell.showImage.kingfishser(data.showPoster)
        cell.showTitle.text = data.showName
        cell.showDate.text = data.from + " ~ " + data.to
        cell.showPlace.text = data.place
        cell.showOpenRun.text = data.openRun // 인기 많은 거 오픈런
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ShowAdd", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: ShowAddVC.identifier) as! ShowAddVC
        
        
        let showXML = showXML[indexPath.row].showCode
        vc.showCode = showXML
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
