//
//  ShowAddVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit
import JGProgressHUD
import SkeletonView

class ShowAddVC: UIViewController {
    
    static let identifier = "ShowAddVC"
    
    @IBOutlet weak var showAddCollectionView: UICollectionView!
    @IBOutlet weak var showAddVCDelay: UIVisualEffectView!
    @IBOutlet weak var showAddVCImage: UIImageView!
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailBackground: UIImageView!
    @IBOutlet weak var detailGenre: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailFromTo: UILabel!
    @IBOutlet weak var detailPerformaceTime: UILabel!
    @IBOutlet weak var detailRunTime: UILabel!
    @IBOutlet weak var detailPlace: UILabel!
    @IBOutlet weak var detailPrice: UILabel!
    @IBOutlet weak var detailAge: UILabel!
    @IBOutlet weak var detailCast: UILabel!
    
    var showCode: String?
    var showImageURL: String?
    var showDetailXML: [ShowDetailXML] = []
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetailApi(showCode: showCode!)
        showDetailUISetting()
        showDetailNavigationScrollSetting()
        showAddCollectionViewSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAddCollectionView.reloadData()
        detailSetting()
        showAddVCDelay.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        showAddVCDelay.isHidden = false
    }
    
    func showDetailUISetting() {
        detailView.layer.cornerRadius = UIScreen.main.bounds.size.width * 0.1
    }
    
    func detailSetting() {
        showAddVCImage.kingfishser(showImageURL ?? "")
        if let xml = showDetailXML.first {
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width * 0.8, height: 50))
            titleLabel.text = xml.showName
            titleLabel.textAlignment = .center
            titleLabel.adjustsFontSizeToFitWidth = true
            self.navigationItem.titleView = titleLabel
            
            detailGenre.text = "공연명( " + xml.genre + " )"
            detailBackground.kingfishser(xml.mainPoster)
            detailTitle.text = xml.showName
            detailFromTo.text = xml.from + " ~ " + xml.to
            detailPerformaceTime.text = xml.performaceTime.replacingOccurrences(of: "), ", with: ")\n")
            detailRunTime.text = xml.runtime
            detailPlace.text = xml.place
            detailPrice.text = xml.price
            detailAge.text = xml.age
            detailCast.text = xml.cast
        } else {
            self.alertCustom(title: "통신 오류", message: "인터넷 상태가 원활하지 않습니다 재시도 해주세요 ", actionTitle: "확인") { UIAlertAction in
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func showDetailNavigationScrollSetting() {
        self.navigationController?.navigationBar.tintColor = .black
        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backPage))
        self.navigationItem.leftBarButtonItem = backButtonItem
        
        let rightSpacingItem = UIBarButtonItem(title: "  ", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightSpacingItem
    }
    
    @objc func backPage() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
