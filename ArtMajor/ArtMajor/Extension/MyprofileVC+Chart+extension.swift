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
        myChartView.backgroundColor = .white
        
        myChartView.chartDescription.enabled = false
        myChartView.drawHoleEnabled = true
        myChartView.holeRadiusPercent = 0.2
        myChartView.transparentCircleRadiusPercent = 0
        
        myChartView.rotationAngle = 0
        myChartView.rotationEnabled = false
        myChartView.isUserInteractionEnabled = false
        
//        myChartView.legend.enabled = false
        
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 50.0, label: "미술"))
        entries.append(PieChartDataEntry(value: 30.0, label: "공연"))
        entries.append(PieChartDataEntry(value: 20.0, label: "오페라"))
        entries.append(PieChartDataEntry(value: 10.0, label: "뮤지컬"))
        entries.append(PieChartDataEntry(value: 10.0, label: "음악"))
        
        let dataSet = PieChartDataSet(entries: entries,label: "")
        dataSet.colors = [#colorLiteral(red: 0.7575295568, green: 0.8916011453, blue: 0.8173599243, alpha: 1), #colorLiteral(red: 0.4000187218, green: 0.5871400237, blue: 0.5885432363, alpha: 1), #colorLiteral(red: 0.4021641612, green: 0.5749253631, blue: 0.7692640424, alpha: 1), #colorLiteral(red: 0.7411827445, green: 0.8263850808, blue: 0.8796476722, alpha: 1), #colorLiteral(red: 0.686755836, green: 0.7732254863, blue: 0.827208221, alpha: 1)]
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
