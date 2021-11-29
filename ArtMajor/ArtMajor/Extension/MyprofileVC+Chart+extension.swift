//
//  MyprofileVC+Chart+extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/23.
//

import UIKit
import Charts

extension MyProfileVC: ChartViewDelegate {
    
    func chartSetting() {
            
        myChartView.delegate = self
        myChartView.layer.cornerRadius = self.myChartView.frame.size.height * 0.03
        myChartView.clipsToBounds = true
        myChartView.backgroundColor = .systemGray5

        myChartView.chartDescription.enabled = false
        myChartView.drawHoleEnabled = true
        myChartView.holeRadiusPercent = 0.2
        myChartView.transparentCircleRadiusPercent = 0
        
        myChartView.rotationAngle = 0
        myChartView.rotationEnabled = false
        myChartView.isUserInteractionEnabled = false
        
//        myChartView.legend.enabled = false

        var entries: [PieChartDataEntry] = Array()
        var sortMaxFavorite = [String: Int]()
        
        let genre = ["연극", "뮤지컬", "무용", "클래식", "오페라", "국악", "전시회", "기타"]
        
        for genre in genre {
            let chartCount = myPageTasks?.filter("genre == '\(genre)'").count ?? 0
            
            if chartCount != 0 {
                entries.append(PieChartDataEntry(value: Double(chartCount), label: genre))
                sortMaxFavorite["\(genre)"] = chartCount
            }
        }
        
        let max = sortMaxFavorite.sorted { $0.1 > $1.1 }
        let overlapCount = max.filter { $0.value == max.first?.value }.count
        
        if let favoriteName = max.first?.key {
            
            var filter = [String: Int]()
            
            for count in 0 ..< overlapCount {
                filter["\(max[count].key)"] = max[count].value
            }
            
            let name = filter.map { $0.key }.reduce("") {$0 + ", " + $1}
            let named = name.trimmingCharacters(in: [","]).trimmingCharacters(in: .whitespacesAndNewlines)
            
            self.myFavoriteTitle.text = "\(named) 분야를 더 선호합니다"
        } else {
            self.myFavoriteTitle.text = "아직 데이터를 저장하시지 않았네요!"
        }
        
        let dataSet = PieChartDataSet(entries: entries,label: "")
        dataSet.colors = [#colorLiteral(red: 0.7575295568, green: 0.8916011453, blue: 0.8173599243, alpha: 1), #colorLiteral(red: 0.4000187218, green: 0.5871400237, blue: 0.5885432363, alpha: 1), #colorLiteral(red: 0.4021641612, green: 0.5749253631, blue: 0.7692640424, alpha: 1), #colorLiteral(red: 0.7411827445, green: 0.8263850808, blue: 0.8796476722, alpha: 1), #colorLiteral(red: 0.686755836, green: 0.7732254863, blue: 0.827208221, alpha: 1), #colorLiteral(red: 0.971098125, green: 0.7994753718, blue: 0.62792027, alpha: 1), #colorLiteral(red: 0.8788266778, green: 0.9202656746, blue: 0.7999430299, alpha: 1), #colorLiteral(red: 0.08487830311, green: 0.4259839952, blue: 0.4916340113, alpha: 1)]
        dataSet.drawValuesEnabled = false

        myChartView.data = PieChartData(dataSet: dataSet)
    }
    
//    let valueData: [PieChartDataEntry] = [
//        PieChartDataEntry(value: <#T##Double#>, label: <#T##String?#>),
//        PieChartDataEntry(value: <#T##Double#>, label: <#T##String?#>),
//        PieChartDataEntry(value: <#T##Double#>, label: <#T##String?#>)
//    ]
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
}
