//
//  ShowVC+UIMemu+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/24.
//

import UIKit
import SwiftUI

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
        
        let localList = ["전국","서울", "인천","대전", "대구", "광주", "부산", "울산", "세종", "경기", "강원", "제주", "대학로"]
        var localItems: [UIAction] = []
        
        for list in localList {
            let local = UIAction(title: list, image: nil) { _ in
                self.selectLocal.setTitle(list, for: .normal)
                self.selectLocal.setImage(nil, for: .normal)
                self.selectGerne.isHidden = false
                switch list { // 이거 뱀인가?ㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                case "전국":
                    self.showApi(local: "")
                case "서울":
                    self.showApi(local: "11")
                case "인천":
                    self.showApi(local: "28")
                case "대전":
                    self.showApi(local: "30")
                case "대구":
                    self.showApi(local: "27")
                case "광주":
                    self.showApi(local: "29")
                case "부산":
                    self.showApi(local: "26")
                case "울산":
                    self.showApi(local: "31")
                case "세종":
                    self.showApi(local: "36")
                case "경기":
                    self.showApi(local: "41")
                case "강원":
                    self.showApi(local: "42")
                case "제주":
                    self.showApi(local: "50")
                case "대학로":
                    self.showApi(local: "UNI")
                default:
                    break
                }
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
        let gerneList = ["전체", "연극", "뮤지컬", "무용", "클래식", "오페라", "국악", "복합"]
        var gerneItems: [UIAction] = []
        
        // 밤새는 중이라 머리가 안돌아가서 나중에 코드 고칠 예정... ㅜㅜ  
        
        for list in gerneList {
            let gerne = UIAction(title: list, image: nil) { _ in
                self.selectGerne.setTitle(list, for: .normal)
                self.selectGerne.setImage(nil, for: .normal)
                self.selectGerne.isHidden = false
                switch list {
                case "전체":
                    self.showXMLfilter = self.showXML
                case "연극":
                    let filter = self.showXML.filter { $0.genre == "연극" }
                    if filter == [] {
                        self.showXMLfilter = []
                        self.alert(title: "다른 카테고리를 선택해주세요", message: "현재 진행중인 공연이 없습니다.", actionTitle: "확인")
                        
                        self.setNoDataPlaceholder("정보가 없어요\n다른 선택지를 선택해주세요", tableView: self.showTableView)
                    } else {
                        self.showXMLfilter = filter
                        self.showTableView.backgroundView?.isHidden = true
                    }
                case "뮤지컬":
                    let filter = self.showXML.filter { $0.genre == "뮤지컬" }
                    if filter == [] {
                        self.showXMLfilter = []
                        self.alert(title: "다른 카테고리를 선택해주세요", message: "현재 진행중인 공연이 없습니다.", actionTitle: "확인")
                        
                        self.setNoDataPlaceholder("정보가 없어요\n다른 선택지를 선택해주세요", tableView: self.showTableView)
                    } else {
                        self.showXMLfilter = filter
                        self.showTableView.backgroundView?.isHidden = true
                    }
                case "무용":
                    let filter = self.showXML.filter { $0.genre == "무용" }
                    if filter == [] {
                        self.showXMLfilter = []
                        self.alert(title: "다른 카테고리를 선택해주세요", message: "현재 진행중인 공연이 없습니다.", actionTitle: "확인")
                        
                        self.setNoDataPlaceholder("정보가 없어요\n다른 선택지를 선택해주세요", tableView: self.showTableView)
                    } else {
                        self.showXMLfilter = filter
                        self.showTableView.backgroundView?.isHidden = true
                    }
                case "클래식":
                    let filter = self.showXML.filter { $0.genre == "클래식" }
                    if filter == [] {
                        self.showXMLfilter = []
                        self.alert(title: "다른 카테고리를 선택해주세요", message: "현재 진행중인 공연이 없습니다.", actionTitle: "확인")
                        
                        self.setNoDataPlaceholder("정보가 없어요\n다른 선택지를 선택해주세요", tableView: self.showTableView)
                    } else {
                        self.showXMLfilter = filter
                        self.showTableView.backgroundView?.isHidden = true
                    }
                case "오페라":
                    let filter = self.showXML.filter { $0.genre == "오페라" }
                    if filter == [] {
                        self.showXMLfilter = []
                        self.alert(title: "다른 카테고리를 선택해주세요", message: "현재 진행중인 공연이 없습니다.", actionTitle: "확인")
                        
                        self.setNoDataPlaceholder("정보가 없어요\n다른 선택지를 선택해주세요", tableView: self.showTableView)
                    } else {
                        self.showXMLfilter = filter
                        self.showTableView.backgroundView?.isHidden = true
                    }
                case "국악":
                    let filter = self.showXML.filter { $0.genre == "국악" }
                    if filter == [] {
                        self.showXMLfilter = []
                        self.alert(title: "다른 카테고리를 선택해주세요", message: "현재 진행중인 공연이 없습니다.", actionTitle: "확인")
                        
                        self.setNoDataPlaceholder("정보가 없어요\n다른 선택지를 선택해주세요", tableView: self.showTableView)
                    } else {
                        self.showXMLfilter = filter
                        self.showTableView.backgroundView?.isHidden = true
                    }
                case "복합":
                    let filter = self.showXML.filter { $0.genre == "복합" }
                    if filter == [] {
                        self.showXMLfilter = []
                        self.alert(title: "다른 카테고리를 선택해주세요", message: "현재 진행중인 공연이 없습니다.", actionTitle: "확인")
                        
                        self.setNoDataPlaceholder("정보가 없어요\n다른 선택지를 선택해주세요", tableView: self.showTableView)
                    } else {
                        self.showXMLfilter = filter
                        self.showTableView.backgroundView?.isHidden = true
                    }
                default:
                    break
                }
                self.showTableView.reloadData()
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
