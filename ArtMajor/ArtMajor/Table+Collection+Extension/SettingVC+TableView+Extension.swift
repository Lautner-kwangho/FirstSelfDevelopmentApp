//
//  SettingVC+TableView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/19.
//

import UIKit

extension SettingVC {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nibName = UINib(nibName: SettingTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.settingLabel.text = settingList[indexPath.section][indexPath.row]
        //        cell.settingLabel.backgroundColor = .gray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //        return SettingVCSection.allCases.count
        return 1 // 여기 수정ㅎ
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "SettingInfoPage", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: SettingInfoPageVC.identifier) as! SettingInfoPageVC
        vc.text = settingList[indexPath.section][indexPath.row]

        let copyStoryboard = UIStoryboard(name: "SettingInfoCopyright", bundle: nil)
        let copyVC = copyStoryboard.instantiateViewController(withIdentifier: SettingInfoCopyrightVC.identifier) as! SettingInfoCopyrightVC
        copyVC.text = settingList[indexPath.section][indexPath.row]
        
        switch indexPath.section {
//        case 0:
//            self.navigationController?.pushViewController(vc, animated: true)
//        case 1:
//            if indexPath.row == 0 {
//                alert(title: "11테스트입니당", message: "test", actionTitle: "ㅇㅋ")
//            } else {
//                alert(title: "22테스트입니당", message: "test", actionTitle: "ㅇㅋ")
//            }
        case 0:
            if indexPath.row == 0 {
                self.navigationController?.pushViewController(copyVC, animated: true)
            } else {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        default:
            break
        }
        
    }
    
}
