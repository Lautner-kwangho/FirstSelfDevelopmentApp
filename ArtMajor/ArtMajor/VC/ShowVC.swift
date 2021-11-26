//
//  DiscountVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit

class ShowVC: UIViewController {
    
    @IBOutlet weak var showTableView: UITableView!
    
    @IBOutlet weak var selectHeader: UIView!
    @IBOutlet weak var selectLocal: UIButton!
    @IBOutlet weak var selectGerne: UIButton!
    
    var showXML: [ShowXML] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTableView.delegate = self
        showTableView.dataSource = self
        showTableView.tableHeaderView = selectHeader
        showTableView.separatorStyle = .none
        
        showApi()
        buttonUISetting()
        selectLocalButtonSetting()
        selectGerneButtonSetting()
    }

    
}
