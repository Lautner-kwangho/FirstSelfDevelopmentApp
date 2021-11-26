//
//  ShowOriginPosterVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import UIKit

class ShowOriginPosterVC: UIViewController {

    static let identifier = "ShowOriginPosterVC"
    
    @IBOutlet weak var showOriginPoster: UIImageView!
    var feedImageHeightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF183830_211126_0109320.jpg
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var cellFrame = showOriginPoster.frame.size
        feedImageHeightConstraint?.constant = getAspectRatioAccordingToiPhones(cellImageFrame: cellFrame, downloadedImage: UIImage(named: "전시회 Sample")!)
    }
    let imageview1 = UIImageView()

    func setupLayout() {
        let so = showOriginPoster
        imageview1.translatesAutoresizingMaskIntoConstraints = false
        imageview1.image = UIImage(named: "전시회 Sample")
        imageview1.contentMode = .scaleAspectFit
        
        view.addSubview(imageview1)
        imageview1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageview1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageview1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        feedImageHeightConstraint = imageview1.heightAnchor.constraint(equalToConstant: 1)
        feedImageHeightConstraint?.priority = UILayoutPriority(rawValue: 999)
        feedImageHeightConstraint?.isActive = true //imageview1.heightAnchor.constraint(greaterThanOrEqualToConstant: view.frame.width).isActive = true

    }
    
    func getAspectRatioAccordingToiPhones(cellImageFrame: CGSize, downloadedImage: UIImage) -> CGFloat {
        let widthOffset = downloadedImage.size.width - cellImageFrame.width
        let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
        let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
        let effectiveHeight = downloadedImage.size.height - heightOffset
        return(effectiveHeight)
    }

}
