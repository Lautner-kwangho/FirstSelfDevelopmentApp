//
//  MyProfileAddVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit
import Kingfisher
import RealmSwift
import SwiftUI
import Photos
import JGProgressHUD

class MyProfileAddVC: UIViewController {

    static let identifier = "MyProfileAddVC"
    
    @IBOutlet weak var addImage: UIImageView!
    
    @IBOutlet weak var addTitle: UITextField!
    @IBOutlet weak var addGenre: UILabel!
    @IBOutlet weak var addDate: UILabel!
    @IBOutlet weak var addContent: UITextView!
    @IBOutlet weak var addTextCount: UILabel!
    
    @IBOutlet weak var buttonDisEnableView: UIView!
    @IBOutlet weak var buttonDisEnableViewText: UILabel!
    
    var localRealm = try! Realm()
    var myPageTasks: Results<MyPageRealm>!
    
    let hud = JGProgressHUD()
    let datePicker = UIDatePicker()
    let formatter = DateFormatter()
    let pickerView = UIPickerView()
    let toolBar = UIToolbar()
    let imagePicker = UIImagePickerController()
    let genre = ["","연극", "뮤지컬", "무용", "클래식", "오페라", "국악", "전시회", "기타"]
//    let readWriteStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
//    PHPho
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPageNavigationSetting()
        PageSetting()
        
        myPageTasks = localRealm.objects(MyPageRealm.self)
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
        imagepickerSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        hud.dismiss()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func addPageNavigationSetting() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(popButton(_:)))
        let gerneButton = UIBarButtonItem(image: UIImage(systemName: "checklist"), style: .done, target: self, action: #selector(selectGenreAction))
        let calendarButton = UIBarButtonItem(image: UIImage(systemName: "calendar"), style: .done, target: self, action: #selector(selectDateAction))
        let saveButton = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .done, target: self, action: #selector(saveButton))
        
        saveButton.tag = 1
        saveButton.isEnabled = false
        self.navigationController?.navigationBar.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItems = [saveButton, calendarButton, gerneButton]
    }
    
    func PageSetting() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.width, height: 300)
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko_KR")
        datePicker.datePickerMode = .date
        
        toolBar.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50)
        toolBar.barStyle = .default
        let button = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(closePicker))
        toolBar.setItems([.flexibleSpace(),button], animated: true)
        
        addImage.layer.borderColor = UIColor.systemGray4.cgColor
        addImage.layer.borderWidth = 0.5
        
        addTitle.delegate = self
        addTitle.placeholder = "제목을 입력해주세요"
        addTitle.text = ""
        
        addContent.delegate = self
        addContent.layer.borderColor = UIColor.systemGray4.cgColor
        addContent.clipsToBounds = true
        addContent.layer.cornerRadius = UIScreen.main.bounds.width * 0.03
        addContent.layer.borderWidth = 1
    }
    
    @objc func closePicker() {
        toolBar.removeFromSuperview()
        pickerView.removeFromSuperview()
        datePicker.removeFromSuperview()
        
        formatter.dateFormat = "yyyy년 MM월 dd일"
        let selectDate = formatter.string(from: datePicker.date)
        
        let buttonEnable = self.navigationItem.rightBarButtonItem!
        if addGenre.text != "분야 : 장르" {
            addDate.text = selectDate
            addDate.textColor = .black
            
            buttonDisEnableView.backgroundColor = .white
            buttonDisEnableView.layer.opacity = 1
            buttonDisEnableViewText.text = "상단 장르를 선택해야\n저장 버튼이 활성화 됩니다!"
            buttonDisEnableView.isHidden = true // 수정
            
            if buttonEnable.tag == 1 {
                buttonEnable.isEnabled = true
            }
            
        } else {
            buttonDisEnableView.backgroundColor = .white
            buttonDisEnableView.layer.opacity = 1
            buttonDisEnableViewText.text = "상단 장르를 선택해야\n저장 버튼이 활성화 됩니다!"
            buttonDisEnableView.isHidden = false
            if buttonEnable.tag == 1 {
                buttonEnable.isEnabled = false
            }
        
        }
        
    }

    @objc func selectGenreAction() {
        datePicker.removeFromSuperview()
        pickerView.backgroundColor = .systemGray6
        pickerView.autoresizingMask = .flexibleWidth
        pickerView.contentMode = .center
        
        self.buttonDisEnableView.isHidden = false
        self.buttonDisEnableView.backgroundColor = .systemGray3
        self.buttonDisEnableView.layer.opacity = 0.8
        self.buttonDisEnableViewText.text = ""
        
        view.addSubview(pickerView)
        view.addSubview(toolBar)
    }
    
    @objc func selectDateAction() {
        if addGenre.text != "분야 : 장르" {
            pickerView.removeFromSuperview()
            datePicker.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.width, height: 300)
            datePicker.backgroundColor = .systemGray6
            datePicker.autoresizingMask = .flexibleWidth
            datePicker.contentMode = .center
            
            view.addSubview(datePicker)
            view.addSubview(toolBar)
        } else {
            alert(title: "장르 선택", message: "장르를 선택해주세요", actionTitle: "확인")
        }
    }
    
    @objc func popButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func saveButton() {
        try! localRealm.write {
            let myPage = MyPageRealm(title: addTitle.text, genre: addGenre.text!.replacingOccurrences(of: "분야 : ", with: ""), date: addDate.text!, content: addContent.text == "내용을 입력해주세요" ? "" : addContent.text)
            localRealm.add(myPage)
            saveImageToDocumentDirectory(imageName: "\(myPage._id).jpg", image: addImage.image!)
        }
        
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
}

extension MyProfileAddVC: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if addTitle.text?.count ?? 0 > 15 {
            alert(title: "글자 수 제한", message: "15자 이내로 입력해주세요", actionTitle: "확인")
            addTitle.deleteBackward()
        }
    }
}

extension MyProfileAddVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if addContent.text == "내용을 입력해주세요" {
            addContent.text = ""
            addContent.textColor = .black
        } else if addContent.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            addContent.text = "내용을 입력해주세요"
            addContent.textColor = .systemGray5
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if addContent.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            addContent.text = "내용을 입력해주세요"
            addContent.textColor = .systemGray5
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if addContent.text.count > 50 {
            alert(title: "글자 수 제한", message: "50자 이내로 입력해주세요", actionTitle: "확인")
            addContent.deleteBackward()
        }
        addTextCount.text = "\(addContent.text.count) / 50 "
    }
}

extension MyProfileAddVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.addGenre.text = "분야 : \(genre[row])"
        
        if self.addGenre.text == "분야 : 장르" {
            self.addGenre.textColor = .systemGray5
        } else if self.addGenre.text == "분야 : " {
           self.addGenre.textColor = .systemGray5
           self.addGenre.text = "분야 : 장르"
       } else {
            self.addGenre.textColor = .black
        }
    }
    
}
