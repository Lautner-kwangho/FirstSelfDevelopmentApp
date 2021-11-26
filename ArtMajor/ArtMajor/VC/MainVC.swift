//
//  MainVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/18.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLocalSelectedButton: UIButton!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var mainCollectionViewBackground: UIImageView!
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
            
        mainButtonSetting()
        mainSelectLocalButtonSetting()
        mainCollectionViewSetting()
        apiTest(place: "")
    }
    
    func gradientBackground() {
        gradientLayer.frame = view.bounds
        backgroundView.layer.addSublayer(gradientLayer)
    }
    
    func blurSetting() {
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.view.frame
//        mainCollectionViewBackground.addSubview(visualEffectView)
    }
    
}
