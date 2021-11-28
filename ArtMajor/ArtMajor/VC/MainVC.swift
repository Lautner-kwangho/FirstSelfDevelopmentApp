//
//  MainVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit
import RealmSwift

class MainVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLocalSelectedButton: UIButton!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var mainCollectionViewBackground: UIImageView!
    
    var localRealm = try! Realm()
    var favoriteTasks: Results<FavoriteRealm>!
    
    var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            CGColor(red: 255/255, green: 242/255, blue: 230/255, alpha: 1),
            CGColor(red: 165/255, green: 237/255, blue: 240/255, alpha: 1)
        ]
        gradient.locations = [0.0, 1.1]
        return gradient
    }()
    
    var currentIndex: CGFloat = 0
    var mainIndexURL: Int = 0 // 이거는 해결 중, 배경색상-사진
    var mainXML: [MainXML] = []
    var mainXMLFilter: [MainXML] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientBackground()
        blurSetting()
            
        RealmSetting()
        
        apiTest(place: "")
        mainButtonSetting()
        mainSelectLocalButtonSetting()
        mainCollectionViewSetting()
        setNoDataPlaceholder("왼쪽 상단을 버튼 지역을 클릭해주시면\n현재진행되고 있는 전시회 정보가 나옵니다", collectionView: mainCollectionView)
        
        // 출시 전에 삭제할 것!
        try! localRealm.write {
            localRealm.deleteAll()
        }
    }
    
    func gradientBackground() {
        gradientLayer.frame = view.bounds
        backgroundView.layer.addSublayer(gradientLayer)
    }
    
    func RealmSetting() {
//        print("Realm is located at:", localRealm.configuration.fileURL!)
        favoriteTasks = localRealm.objects(FavoriteRealm.self)
    }
    
    func blurSetting() {
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.view.frame
//        mainCollectionViewBackground.addSubview(visualEffectView)
    }
    
}
