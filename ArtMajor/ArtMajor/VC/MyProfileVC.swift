//
//  MyProfileVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit
import Charts
import RealmSwift
import JGProgressHUD

class MyProfileVC: UIViewController {

    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myFavoriteTitle: UILabel!
    @IBOutlet weak var myProfileView: UIView!
    
    @IBOutlet weak var myProfileChartBackground: UIView!
    
    @IBOutlet weak var myChartView: PieChartView!
    @IBOutlet weak var myProfileCollectionView: UICollectionView!
    @IBOutlet weak var addPostButton: UIButton!
    
    var localRealm = try! Realm()
    var myPageTasks: Results<MyPageRealm>!
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myProfileCollectionViewSetting()
        
        myPageTasks = localRealm.objects(MyPageRealm.self)
        myFavoriteTitle.adjustsFontSizeToFitWidth = true
        myFavoriteTitle.numberOfLines = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        chartSetting()
        
        myProfileCollectionView.reloadData()
        myChartView.animate(xAxisDuration: 1.5)
        myChartView.animate(yAxisDuration: 1.5)
        
        if myPageTasks.isEmpty {
            setNoDataPlaceholder("오른쪽 상단 버튼을 눌러\n추억을 저장해보세요!", collectionView: myProfileCollectionView)
        } else {
            self.myProfileCollectionView.backgroundView?.isHidden = true
        }
        
        if myFavoriteTitle.text == "아직 데이터를 저장하시지 않았네요!" {
            myProfileChartBackground.backgroundColor = .systemGray5
            myChartView.isHidden = true
        } else {
            myProfileChartBackground.backgroundColor = .white
            myChartView.isHidden = false
        }
        hud.dismiss(animated: true)
    }
    
    @IBAction func addPostClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: MyProfileAddVC.identifier) as! MyProfileAddVC
        
        hud.show(in: self.view, animated: true)
        hud.progress = 0.1
        hud.style = .extraLight
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
