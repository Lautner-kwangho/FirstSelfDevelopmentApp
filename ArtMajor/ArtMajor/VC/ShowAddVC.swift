//
//  ShowAddVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit

class ShowAddVC: UIViewController {

    static let identifier = "ShowAddVC"
    
    @IBOutlet weak var showAddCollectionView: UICollectionView!
    
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
    var showDetailXML: [ShowDetailXML] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetailUISetting()
        showDetailApi(showCode: showCode!)
        showAddCollectionViewSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(showDetailXML)
        showAddCollectionView.reloadData()
        detailSetting()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func showDetailUISetting() {
        detailView.layer.cornerRadius = UIScreen.main.bounds.size.width * 0.1
    }
    
    func detailSetting() {
        
        if let xml = showDetailXML.first {
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
            self.alert(title: "통신 오류", message: "인터넷 상태가 원활하지 않습니다 재시도 해주세요 ", actionTitle: "확인")
        }
    }
    
}
