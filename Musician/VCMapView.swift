//
//  VCMapView.swift
//  Musician
//
//  Created by John Detjen on 6/13/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import Foundation
import MapKit

extension ViewController: MKMapViewDelegate {
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Artwork {
            let identifier = "pin"
            var view: MKPinAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            view.pinTintColor = UIColor.gray
            if annotation.tour?.object(forKey: "status") as? String == "Booked" {
                view.pinTintColor = UIColor.green
            }
                
            else if annotation.tour?.object(forKey: "status") as? String == "Hold" {
                view.pinTintColor = UIColor.magenta
            }
            return view
        }
        return nil
    }
}
