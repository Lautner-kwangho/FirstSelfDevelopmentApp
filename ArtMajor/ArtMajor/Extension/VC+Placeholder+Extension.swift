//
//  UITableView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/27.
//

import UIKit

extension UIViewController {
    // placeHolder 
    func setNoDataPlaceholder(_ message: String, tableView: UITableView) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        label.text = message
        label.textAlignment = .center
        label.textColor = .systemGray2
        label.sizeToFit()
        label.numberOfLines = 0
//        let view: UIView = {
//            let view = UIView()
//            view.backgroundColor = .carrot
//            return view
//        }()
//        label.addSubview(view)
        tableView.backgroundView = label
        tableView.isScrollEnabled = true // false
        tableView.separatorStyle = .none
    }
    
    func setNoDataPlaceholder(_ message: String, collectionView: UICollectionView) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        label.text = message
        label.textAlignment = .center
        label.textColor = .systemGray2
        label.sizeToFit()
        label.numberOfLines = 0
        collectionView.backgroundView = label
    }
    
}
