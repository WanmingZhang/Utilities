//
//  Map.swift
//  Utility
//
//  Created by Zhang, Wanming on 2/9/22.
//

import Foundation
import MapKit

//MARK: MKMapViewDelegate
    
class CustomPin:  NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let image: UIImage?
    
    init(title:String?, image: UIImage?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        self.image = image
        super.init()
    }
    
}

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard let incidentPin = annotation as? CustomPin else {
            return nil
        }
        let identifier = "Annotation Identifier"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            annotationView.canShowCallout = false
            annotationView.image = incidentPin.image
                                           
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let pin = view.annotation as? CustomPin else {
            return
        }
        // set new title, image etc.
        print(pin)
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        guard let pin = view.annotation as? CustomPin else {
            return
        }
        // set new title, image etc.
        print(pin)
    }
    

