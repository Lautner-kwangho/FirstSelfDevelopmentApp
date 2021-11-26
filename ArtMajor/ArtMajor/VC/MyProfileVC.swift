//
//  MyProfileVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit
import Charts

class MyProfileVC: UIViewController {

    @IBOutlet weak var myProfileView: UIView!
    @IBOutlet weak var myChartView: PieChartView!
    @IBOutlet weak var myProfileCollectionView: UICollectionView!
    @IBOutlet weak var addPostButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartSetting()
        myProfileCollectionViewSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myChartView.animate(xAxisDuration: 1.5)
        myChartView.animate(yAxisDuration: 1.5)
    }
    
    @IBAction func addPostClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: MyProfileAddVC.identifier) as! MyProfileAddVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
