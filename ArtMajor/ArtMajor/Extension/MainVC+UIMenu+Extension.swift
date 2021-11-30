//
//  MainVC+UIMenu+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/25.
//

import UIKit

extension MainVC {
    func mainButtonSetting() {
        mainLocalSelectedButton.isHidden = true
        let button = [mainLocalSelectedButton]
        for btn in button {
            btn?.layer.cornerRadius = (btn?.frame.size.width)! * 0.05
            btn?.layer.addBorder([.bottom], color: .red, width: 1)
            btn?.titleLabel?.font = UIFont().plain
            btn?.titleLabel?.adjustsFontSizeToFitWidth = false
            btn?.titleLabel?.textAlignment = .center
        }
    }
    
    func mainSelectLocalButtonSetting() {
                
        let localList = ["전체", "서울", "인천", "대전", "대구", "광주", "부산", "울산", "세종", "경기", "경남", "전북", "제주"]
        var localItems: [UIAction] = []
        
        for list in localList {
            let local = UIAction(title: list, image: nil) { _ in
                self.mainLocalSelectedButton.setTitle(list, for: .normal)
                self.mainLocalSelectedButton.setImage(nil, for: .normal)
                
                self.mainLocalSelectButtonHide.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                self.mainLocalSelectedButton.isHidden = true
                self.localSelectedButton = !self.localSelectedButton
                
                if list == "전체" {
                    self.apiTest(place: "")
                } else {
                    self.apiTest(place: list)
                }
            }
            localItems.append(local)
        }
        
        var demoMemu: UIMenu {
            return UIMenu(title: "", image: nil, identifier: nil, options: [], children: localItems)
        }
        
        if #available(iOS 14.0 , *) {
            self.mainLocalSelectedButton.menu = demoMemu
            self.mainLocalSelectedButton.showsMenuAsPrimaryAction = true
        
        }
    }
}
