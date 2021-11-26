//
//  MainVC+CollectionView+Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/19.
//

import UIKit

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func mainCollectionViewSetting() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        let mainCollectionViewLayout = UICollectionViewFlowLayout()
        let spacing: CGFloat = UIScreen.main.bounds.width * 0.1
        let width = UIScreen.main.bounds.width * 0.8
        mainCollectionViewLayout.itemSize = CGSize(width: width, height: mainCollectionView.frame.size.height * 0.95)
        mainCollectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        mainCollectionViewLayout.scrollDirection = .horizontal
        mainCollectionView.collectionViewLayout = mainCollectionViewLayout
        
        mainCollectionView.decelerationRate = .fast
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.8, height: mainCollectionView.frame.size.height * 0.95)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainLocalSelectedButton.currentTitle == "" || mainLocalSelectedButton.currentTitle == "전체" ? mainXML.count : mainXMLFilter.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nibName = UINib(nibName: MainCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        let selectXML = mainLocalSelectedButton.currentTitle == "" || mainLocalSelectedButton.currentTitle == "전체" ? mainXML : mainXMLFilter
        let xmlData = selectXML[indexPath.item]
        mainIndexURL = indexPath.item
        
        cell.mainCollectionPosterImage.kingfishser(xmlData.posterImage)
        cell.mainCollectionBackgroundBlur.kingfishser(xmlData.posterImage)
        cell.mainCollectionFavoriteButton.tag = indexPath.item
        cell.mainCollectionFavoriteButton.addTarget(self, action: #selector(switchFavoriteButton), for: .touchUpInside)
        
        return cell
    }
    
    @objc func switchFavoriteButton(mainCollectionFavoriteButton button: UIButton) {
        print(button.tag)
//        false = !true
//        mainCollectionView.reloadItems(at: [IndexPath(item: button.tag, section: 0)])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "MainInfo", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainInfoVC") as! MainInfoVC
        
        let selectXML = mainLocalSelectedButton.currentTitle == "지역을 선택해주세요!" || mainLocalSelectedButton.currentTitle == "전체" ? mainXML : mainXMLFilter
        let xmlData = selectXML[indexPath.item]
        vc.mainData = xmlData
        vc.modalTransitionStyle = .flipHorizontal
        
        self.present(vc, animated: true)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print(12)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(self.mainIndexURL)
        
        mainCollectionViewBackground = MainCollectionViewCell().mainCollectionPosterImage
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        // item size와 item 간격 사이즈 구해서 하나의 item 크기로 설정
        let layout = self.mainCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            
        // x 좌표로 얼마나 이동했는지 확인
        // 이동한 x 좌표 값과 item size비교 해서 얼마나 페이징 될 건지 설정
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundIndex = round(index)
        
        // scrollView, targetContentOffset 스크롤 방향 알아낼 수 있음
        // index를 반올림해서 사용하면 item의 절반 size만큼 스크롤해야 페이징 됨
        // 방향 설정해줘서 페이징 효과
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundIndex = floor(index)
        } else {
            roundIndex = ceil(index)
        }
        
        offset = CGPoint(x: roundIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
}
