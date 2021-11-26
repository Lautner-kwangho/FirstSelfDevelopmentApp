//
//  Alert+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/20.
//

import UIKit

extension UIViewController {
    func alert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertCustom(title: String, message: String, actionTitle: String, handler: @escaping (UIAlertAction) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: actionTitle, style: .default,handler: handler)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
