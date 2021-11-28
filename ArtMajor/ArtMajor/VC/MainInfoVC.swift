//
//  MainInfoVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/20.
//

import UIKit
import MapKit
import CoreLocation
import CoreLocationUI
import RealmSwift
import Toast

class MainInfoVC: UIViewController {

    @IBOutlet weak var mainInfoView: UIView!
    @IBOutlet weak var mainInfoImage: UIImageView!
    
    @IBOutlet weak var mainInfoTitle: UILabel!
    @IBOutlet weak var mainInfoDate: UILabel!
    @IBOutlet weak var mainInfoArea: UILabel!
    @IBOutlet weak var mainInfoPrice: UILabel!
    @IBOutlet weak var mainInfoPhone: UILabel!
    
    @IBOutlet weak var mainInfoFavoriteButton: UIButton!
    @IBOutlet weak var mainInfoMapkit: MKMapView!
    let locationManager = CLLocationManager()
    
    var localRealm = try! Realm()
    var favoriteTasks: Results<FavoriteRealm>!
    
    var mainData: MainXML!
    var infoData: [MainInfoXML] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteTasks = localRealm.objects(FavoriteRealm.self)
        mainInfoRealm()
        
        mainInfoApi(seq: mainData.seq)
        inputDataSetting()
        infoUIsetting()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inputDetailSetting()
    }
    
    func infoUIsetting() {
        mainInfoView.clipsToBounds = true
        mainInfoView.layer.cornerRadius = UIScreen.main.bounds.height * 0.03
        
        mainInfoDate.adjustsFontSizeToFitWidth = true
        ToastManager.shared.isTapToDismissEnabled = true
    }
    
    func inputDataSetting() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let formatStartDate = formatter.date(from: mainData.startDate)!
        let formatEndDate = formatter.date(from: mainData.endDate)!
        
        formatter.dateFormat = "yyyy. MM. dd"
        let start = formatter.string(from: formatStartDate)
        let end = formatter.string(from: formatEndDate)
        
        let titleFilter = mainData.title.replacingOccurrences(of: "&gt;", with: ">").replacingOccurrences(of: "&quot;", with: "\"").replacingOccurrences(of: "&amp;", with: "&").replacingOccurrences(of: "&apos;", with: "'").replacingOccurrences(of: "&lt;", with: "<")
        
        mainInfoTitle.text = titleFilter
        mainInfoDate.text = "\(start) ~ \(end)"
        mainInfoArea.text = mainData.area
        
        mainInfoImage.kingfishser(mainData.posterImage)
        mapSetting(mapKit: mainInfoMapkit, latitude: Double(mainData.gpsY) ?? 37.55363847085363, longitude: Double(mainData.gpsX) ?? 126.97085840058627, annotationTitle: mainData.place)
    }
    
    func inputDetailSetting() {
        mainInfoPrice.text = infoData.first?.price
        mainInfoPhone.text = infoData.first?.phone
    }

    @IBAction func dismissPage(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
