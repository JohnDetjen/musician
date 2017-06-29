//
//  ShowDateViewController.swift
//  Musician
//
//  Created by John Detjen on 6/23/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import MapKit
import SCLAlertView

class ShowDateViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var showObject: PFObject?
    
    let regionRadius: CLLocationDistance = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let artwork = Artwork(title: "",
                              locationName: "",
                              discipline: "",
                              coordinate: CLLocationCoordinate2D())
        
        mapView.addAnnotation(artwork)
        
//        mapView.delegate = self
        
        if let myVenues = PFUser.current()?.object(forKey: "myTour") as? [PFObject] {
            for aVenue in myVenues {
                aVenue.fetchIfNeededInBackground(block: { (obj, error) in
                    if let name = obj?.object(forKey: "name") as? String, let coordinate = obj?.object(forKey: "venueLocation") as? PFGeoPoint, let capacity = obj?.object(forKey: "capacity") as? Int {
                        let aArtWork = Artwork(title: name, locationName: "Capacity \(capacity)", discipline: "hkadslhj", coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
                        self.mapView.addAnnotation(aArtWork)
                    }
                })
            }
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 5000.0, regionRadius * 5000.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        showObject?.setObject(datePicker.date, forKey: "date")
        showObject?.saveInBackground()
        
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "HereNowAlertController") //Replace the IconImage text with the image name
        alertView.showInfo("Venue Added", subTitle: "\nGo to your tour page and start booking venues!", circleIconImage: alertViewIcon)
        
        _ = self.navigationController?.popViewController(animated: true)
    }

}
