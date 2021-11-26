//
//  ShowOriginPosterVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/26.
//

import UIKit

// 이 페이지 전체 수정 예정 ㅜㅜ 급하다 급해
class ShowOriginPosterVC: UIViewController, height {

    func height(size: CGFloat) {
        collectionViewHeight = size
    }
    
    static let identifier = "ShowOriginPosterVC"
    
    @IBOutlet weak var showOriginPoster: UIImageView!
    
    @IBOutlet weak var showScrollView: UIScrollView!
    
    var collectionViewHeight: CGFloat?

    var feedImageHeightConstraint: NSLayoutConstraint?
    let imageview1 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        showOriginPoster.frame.size.height = collectionViewHeight!
//        let cellFrame = showOriginPoster.frame.size
//        feedImageHeightConstraint?.constant = getAspectRatioAccordingToiPhones(cellImageFrame: cellFrame, downloadedImage: image!)
    }
    
/*
    func setupLayout() {
        imageview1.translatesAutoresizingMaskIntoConstraints = false
        imageview1.image = image
        imageview1.contentMode = .scaleAspectFit
        
        view.addSubview(imageview1)
        imageview1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageview1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageview1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        feedImageHeightConstraint = imageview1.heightAnchor.constraint(equalToConstant: 1)
        feedImageHeightConstraint?.priority = UILayoutPriority(rawValue: 999)
        feedImageHeightConstraint?.isActive = true
        //imageview1.heightAnchor.constraint(greaterThanOrEqualToConstant: view.frame.width).isActive = true
        
    }
    
    func getAspectRatioAccordingToiPhones(cellImageFrame: CGSize, downloadedImage: UIImage) -> CGFloat {
        let widthOffset = downloadedImage.size.width - cellImageFrame.width
        let widthOffsetPercentage = (widthOffset * 100) / downloadedImage.size.width
        let heightOffset = (widthOffsetPercentage * downloadedImage.size.height) / 100
        let effectiveHeight = downloadedImage.size.height - heightOffset
        return(effectiveHeight)
    }

    */
}
