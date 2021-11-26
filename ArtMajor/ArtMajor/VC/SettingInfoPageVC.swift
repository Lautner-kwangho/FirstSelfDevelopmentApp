//
//  SettingInfoPageVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

class SettingInfoPageVC: UIViewController {

    static let identifier = "SettingInfoPageVC"
    
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoContent: UILabel!
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if text == "사용자" {
            userPageSetting()
        } else {
            versionSetting()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func userPageSetting() {
        
        infoImage.clipsToBounds = true
        infoImage.layer.cornerRadius = infoImage.frame.size.width * 0.35
        
        infoContent.text = "안녕하세요 \(text!)"
    }
    
    func versionSetting() {
        
        infoImage.clipsToBounds = true
        infoImage.layer.cornerRadius = infoImage.frame.size.height * 0.2
        
        infoContent.text = "현재 버전은 1.0.0입니디ㅏ"
    }
    
    

}
