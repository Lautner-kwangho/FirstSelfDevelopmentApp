//
//  SettingInfoCopyrightVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/24.
//

import UIKit

class SettingInfoCopyrightVC: UIViewController {
    
    static let identifier = "SettingInfoCopyrightVC"
    
    @IBOutlet weak var copyTitle: UILabel!
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        copyTitle.text = text
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    

}
