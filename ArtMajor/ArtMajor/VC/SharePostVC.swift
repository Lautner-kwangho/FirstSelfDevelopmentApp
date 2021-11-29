//
//  SharePostVC.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/22.
//

import UIKit
import RealmSwift

class SharePostVC: UIViewController {

    static let identifier = "SharePostVC"
    
    @IBOutlet weak var sharePostImage: UIImageView!
    @IBOutlet weak var sharePostTitle: UILabel!
    @IBOutlet weak var sharePostDate: UILabel!
    @IBOutlet weak var sharePostContent: UILabel!
    
    var localRealm = try! Realm()
    var myPageTasks: Results<MyPageRealm>!
    
    var id: ObjectId?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControllerSetting()
         
        myPageTasks = localRealm.objects(MyPageRealm.self)
        
        if let id = id {
            let specificUser = myPageTasks.where {
                $0._id == id
            }
            sharePostImage.image = loadImageFromDocumentDirectory(imageName: "\(specificUser.first!._id).jpg")
            sharePostTitle.text = specificUser.first!.title
            sharePostDate.text = "작성일자 : \(specificUser.first!.date)"
            sharePostContent.text = specificUser.first!.content
            print(specificUser)
        } else {
            self.alert(title: "데이터 로딩", message: "데이터를 불러오지 못했습니다 ", actionTitle: "확인")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func navigationControllerSetting() {
        let deleteButton = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .done, target: self, action: #selector(deletePage))
//        let editButton = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .done, target: self, action: #selector(editAction))
//        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(popPage))
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(popPage))

        self.navigationController?.navigationBar.tintColor = .black
        
//        self.navigationItem.rightBarButtonItems = [editButton, deleteButton]
        self.navigationItem.rightBarButtonItems = [deleteButton]
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func editAction() {
//        sharePostTitle.textInputMode
    }
    
    @objc func deletePage() {
        let alert = UIAlertController(title: "데이터를 삭제", message: "데이터를 삭제하시겠습니까?", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: "삭제", style: .default) { _ in
            self.deleteImageFromDocumentDirectory(imageName: "\(self.id!).jpg")
            try! self.localRealm.write {
                let currentPage = self.myPageTasks.where {
                    $0._id == self.id!
                }
                self.myPageTasks.realm?.delete(currentPage)
                self.navigationController?.popViewController(animated: true)
            }
        }

        alert.addAction(okButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func popPage() {
        self.navigationController?.popViewController(animated: true)
    }
}
