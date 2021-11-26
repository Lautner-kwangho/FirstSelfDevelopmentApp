//
//  ShowVC+UIMemu+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/24.
//

import UIKit

extension ShowVC {
    
    func buttonUISetting() {
        let button = [selectLocal, selectGerne]
        for btn in button {
            btn?.layer.cornerRadius = (btn?.frame.size.width)! * 0.1
            btn?.layer.addBorder([.bottom], color: .red, width: 1)
            btn?.titleLabel?.font = UIFont().plain
            btn?.titleLabel?.adjustsFontSizeToFitWidth = true
            btn?.titleLabel?.textAlignment = .center
        }
    }
    
    func selectLocalButtonSetting() {
        
        selectGerne.isHidden = true
        
        let localList = ["서울", "인천","대전", "대구", "광주", "부산", "울산", "세종", "경기", "충청", "경상", "전라", "강원", "제주", "대학로"]
        var localItems: [UIAction] = []
        
        for list in localList {
            let local = UIAction(title: list, image: nil) { _ in
                self.selectLocal.setTitle(list, for: .normal)
                self.selectLocal.setImage(nil, for: .normal)
                self.selectGerne.isHidden = false
                print(list)
            }
            localItems.append(local)
        }
        
        var demoMemu: UIMenu {
            self.showTableView.reloadData()
            return UIMenu(title: "", image: nil, identifier: nil, options: [], children: localItems)
        }
        
        if #available(iOS 14.0 , *) {
            selectLocal.menu = demoMemu
            selectLocal.showsMenuAsPrimaryAction = true
        
        }
    }
    
    func selectGerneButtonSetting() {
        let gerneList = ["연극", "뮤지컬", "무용", "클래식", "오페라", "국악", "복합"]
        var gerneItems: [UIAction] = []
        
        for list in gerneList {
            let gerne = UIAction(title: list, image: nil) { _ in
                self.selectGerne.setTitle(list, for: .normal)
                self.selectGerne.setImage(nil, for: .normal)
                self.selectGerne.isHidden = false
                print(list)
            }
            gerneItems.append(gerne)
        }
        
        var demoMemu: UIMenu {
            self.showTableView.reloadData()
            return UIMenu(title: "", image: nil, identifier: nil, options: [], children: gerneItems)
        }
        
        if #available(iOS 14.0 , *) {
            selectGerne.menu = demoMemu
            selectGerne.showsMenuAsPrimaryAction = true
        
        }
    }

}
