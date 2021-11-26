//
//  MainInfoVC+Mapkit_Extension.swift
//  ArtMajor
//
//  Created by 최광호 on 2021/11/23.
//

import UIKit
import MapKit
import CoreLocation

extension MainInfoVC {
    func mapSetting(mapKit mk: MKMapView, latitude: CLLocationDegrees, longitude: CLLocationDegrees, annotationTitle: String) {
        // 지도 설정
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location,span: span)
        mk.setRegion(region, animated: true)
        
        // 어노테이션 설정
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = annotationTitle
        mk.addAnnotation(annotation)
        
    }
}
