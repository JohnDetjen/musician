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
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
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
            view.pinTintColor = UIColor(red: 46.0/255.0 , green:  53.0/255.0 , blue :  73.0/255.0 , alpha: 1.0)
            if annotation.tour?.object(forKey: "status") as? String == "Booked" {
                view.pinTintColor = UIColor(red: 41.0/255.0 , green:  186.0/255.0 , blue :  142.0/255.0 , alpha: 1.0)
            }
                
            else if annotation.tour?.object(forKey: "status") as? String == "Hold" {
                view.pinTintColor = UIColor(red: 240.0/255.0 , green:  53.0/255.0 , blue :  93.0/255.0 , alpha: 1.0)
            }
            return view
        }
        return nil
    }
}


extension ShowDateViewController: MKMapViewDelegate {
    
    // 1
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
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
            view.pinTintColor = UIColor(red: 46.0/255.0 , green:  53.0/255.0 , blue :  73.0/255.0 , alpha: 1.0)
            if annotation.tour?.object(forKey: "status") as? String == "Booked" {
                view.pinTintColor = UIColor(red: 41.0/255.0 , green:  186.0/255.0 , blue :  142.0/255.0 , alpha: 1.0)
            }
                
            else if annotation.tour?.object(forKey: "status") as? String == "Hold" {
                view.pinTintColor = UIColor(red: 240.0/255.0 , green:  53.0/255.0 , blue :  93.0/255.0 , alpha: 1.0)
            }
            return view
        }
        return nil
    }
}
