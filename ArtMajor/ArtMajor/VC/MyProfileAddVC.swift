//
//  MyProfileAddVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

class MyProfileAddVC: UIViewController {

    static let identifier = "MyProfileAddVC"
    
    @IBOutlet weak var addImage: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPageNavigationSetting()
        imagepickerSetting()
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
    
    func addPageNavigationSetting() {
        let gerneButton = UIBarButtonItem(image: UIImage(systemName: "checklist"), style: .done, target: self, action: #selector(popButton(_:)))
        let calendarButton = UIBarButtonItem(image: UIImage(systemName: "calendar"), style: .done, target: self, action: #selector(popButton(_:)))
        let saveButton = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .done, target: self, action: #selector(popButton(_:)))
        
        self.navigationController?.navigationBar.tintColor = .black
        
        self.navigationItem.rightBarButtonItems = [saveButton, calendarButton, gerneButton]
    }
    

    @objc func popButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
