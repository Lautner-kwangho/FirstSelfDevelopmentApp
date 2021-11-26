//
//  MainVC+TabBar+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit

class MainVC_TabBar_Extension: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 2
        self.tabBar.backgroundColor = .white
        
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.3719329834, green: 0.8837229609, blue: 0.8268244863, alpha: 1)
    }

}
