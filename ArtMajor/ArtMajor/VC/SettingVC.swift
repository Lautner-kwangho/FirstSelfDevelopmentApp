//
//  SettingVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit

class SettingVC: UIViewController {
    
    let settingList = [
//        ["사용자"],
//        ["백업하기", "복구하기"],
//        ["앱 기능 및 저작권", "앱 현재 버전"]
        ["앱 기능 및 저작권"]
    ]
    
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    
}
