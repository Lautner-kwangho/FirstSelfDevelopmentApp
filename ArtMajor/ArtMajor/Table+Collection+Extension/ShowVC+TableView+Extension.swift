//
//  ShowVC+TableView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

extension ShowVC: UITableViewDataSourcePrefetching {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectGerne.isHidden == true || selectGerne.currentTitle == "전체" {
            return showXML.count
        } else {
            return showXMLfilter.count
        }

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nibName = UINib(nibName: ShowTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: ShowTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowTableViewCell.identifier, for: indexPath) as? ShowTableViewCell else {
            return UITableViewCell()
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        formatter.locale = Locale(identifier: "ko_KR")
        let today = formatter.string(from: Date())
        
        if selectGerne.isHidden == true || selectGerne.currentTitle == "전체" {
            let data = showXML[indexPath.row]
            
            cell.showImage.kingfishser(data.showPoster)
            cell.showTitle.text = data.showName
            cell.showDate.text = data.from + " ~ " + data.to
            cell.showPlace.text = data.place
            if data.to == today {
                cell.showState.text = "공연일"
            } else {
                cell.showState.text = data.showState // 인기 많은 거 오픈런
            }
        } else {
            let data = showXMLfilter[indexPath.row]
            
            cell.showImage.kingfishser(data.showPoster)
            cell.showTitle.text = data.showName
            cell.showDate.text = data.from + " ~ " + data.to
            cell.showPlace.text = data.place
            if data.to == today {
                cell.showState.text = "공연일"
            } else {
                cell.showState.text = data.showState // 인기 많은 거 오픈런
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ShowAdd", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: ShowAddVC.identifier) as! ShowAddVC
        
        
        if selectGerne.isHidden == true || selectGerne.currentTitle == "전체" {
            let showXML = showXML[indexPath.row]
            vc.showCode = showXML.showCode
            let image = showXML.showPoster
            vc.showImageURL = image
        } else {
            let showXML = showXMLfilter[indexPath.row]
            vc.showCode = showXML.showCode
            let image = showXML.showPoster
            vc.showImageURL = image
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            // 음 그냥 한번에 불러올까... API 횟수도 작은데;
        }
    }
}
