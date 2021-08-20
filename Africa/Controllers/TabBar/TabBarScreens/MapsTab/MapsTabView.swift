//
//  MapsTabView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 19/08/21.
//

import UIKit
import MapKit

protocol MapsTabViewDataSource: AnyObject {
    var locations: [NationalParkLocation] {get}
}

class MapsTabView: UIView {
    @IBOutlet weak var mapKit: MKMapView!
    
    weak var dataSource: MapsTabViewDataSource?
    
    private var region: MKCoordinateRegion = {
      var mapCoordinates = CLLocationCoordinate2D(latitude: -15.600286, longitude: 30.4377599)
      var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40.0)
      var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
      
      return mapRegion
    }()
    
    func updateUI() {
        mapKit.delegate = self
        mapKit.setRegion(region, animated: false)
        
        addAnnotations(dataSource?.locations ?? [])
    }
    
    func addAnnotations(_ locations: [NationalParkLocation]) {
      for location in locations {
        let annotation = MKPointAnnotation()
        annotation.title = location.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        mapKit.addAnnotation(annotation)
      }
    }
    
}

extension MapsTabView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)

        if annotationView == nil {
            if let first = annotation.title, let image = first?.components(separatedBy: " ").first {
                annotationView = CustomPointAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier, image: "map-" + image.lowercased())
                print("map-" + image)
            }
            
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

//        annotationView?.image = UIImage(named: "logoRounded")
//        annotationView?.layer.borderWidth = 2.0
//        annotationView?.layer.borderColor = UIColor.red.cgColor

        return annotationView
    }
}
