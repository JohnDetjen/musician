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
import MBProgressHUD

class ShowDateViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    
//    var showObject: PFObject?
//    var tours = [PFObject]()
    
    var venue: PFObject?
    
    let regionRadius: CLLocationDistance = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let artwork = Artwork(title: "",
//                              locationName: "",
//                              discipline: "",
//                              coordinate: CLLocationCoordinate2D())
//        
//        mapView.addAnnotation(artwork)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        centerMap()
//        if let currentUser = PFUser.current() {
//            let query = PFQuery(className: "Tour")
//            //filter query by user
//            query.whereKey("user", equalTo: currentUser)
//            //if something is a pointer, this gives all the information for that pfobject
//            query.includeKey("venue")
//            
//            query.findObjectsInBackground { (objects, error) in
//                if let theObjects = objects {
//                    self.tours = theObjects
//                    self.mapView.removeAnnotations(self.mapView.annotations)
//                    for aVenue in theObjects {
//                        let obj = aVenue.object(forKey: "venue") as? PFObject
//                        if let name = obj?.object(forKey: "name") as? String, let coordinate = obj?.object(forKey: "venueLocation") as? PFGeoPoint, let capacity = obj?.object(forKey: "capacity") as? Int {
//                            let aArtWork = Artwork(title: name, locationName: "Capacity \(capacity)", discipline: "hkadslhj", coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
//                            self.mapView.addAnnotation(aArtWork)
//                        }
//                    }
//                }
//            }
//        }
    }

    
    func centerMap() {
       
        let name = venue?.object(forKey: "name") as? String ?? ""
        let capacity = venue?.object(forKey: "capacity") as? Int ?? 0
        guard let geoPoint = venue?.object(forKey: "venueLocation") as? PFGeoPoint else {
            return
        }
        
        let coordinates = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinates,
                                                                  regionRadius * 5000.0, regionRadius * 5000.0)
        mapView.setRegion(coordinateRegion, animated: true)
        let artWork = Artwork(title: name, locationName: "Capacity \(capacity)", discipline: "", coordinate: coordinates)
        self.mapView.addAnnotation(artWork)
        self.mapView.showAnnotations([artWork], animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
//        showObject?.setObject(datePicker.date, forKey: "date")
//        showObject?.saveInBackground()
        if let theVenue = venue, let user = PFUser.current() {
            let venueInfo = PFObject(className: "Tour")
            venueInfo.setObject(theVenue, forKey: "venue")
            venueInfo.setObject(user, forKey: "user")
            venueInfo.setObject(datePicker.date, forKey: "date")
            MBProgressHUD.showAdded(to: view, animated: true)
            venueInfo.saveInBackground(block: { (success, error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if success {
                    let appearance = SCLAlertView.SCLAppearance(
                        showCircularIcon: true
                    )
                    let alertView = SCLAlertView(appearance: appearance)
                    let alertViewIcon = UIImage(named: "HereNowAlertController") //Replace the IconImage text with the image name
                    alertView.showInfo("Venue Added", subTitle: "\nGo to your tour map and start booking venues!", circleIconImage: alertViewIcon)
                    let _ = self.navigationController?.popViewController(animated: true)
                }
                else {
                    print("there was an error saving the tour")
                }
            })
        }
    }

}
