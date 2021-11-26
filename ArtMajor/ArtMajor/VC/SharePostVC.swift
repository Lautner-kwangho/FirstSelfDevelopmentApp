//
//  SharePostVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

class SharePostVC: UIViewController {

    static let identifier = "SharePostVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControllerSetting()
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
    
    func navigationControllerSetting() {
        let deleteButton = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .done, target: self, action: #selector(popPage))
        let editButton = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .done, target: self, action: #selector(popPage))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(popPage))

        self.navigationController?.navigationBar.tintColor = .black
        
        self.navigationItem.rightBarButtonItems = [shareButton, editButton, deleteButton]
    }
    
    @objc func popPage() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
