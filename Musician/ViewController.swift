//
//  ViewController.swift
//  Musician
//
//  Created by John Detjen on 6/13/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import MapKit
import Parse

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var manageTour: UIButton!
    @IBOutlet weak var mangeTourButtonWidth: NSLayoutConstraint!
    
    @IBOutlet weak var manageTourTop: NSLayoutConstraint!
    @IBOutlet weak var manageTourTrailing: NSLayoutConstraint!
    var tours = [PFObject]()

    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gilroy-Light", size: 18)!]

        
        manageTour.layer.cornerRadius = 5
        manageTour.clipsToBounds = true
        manageTour.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        manageTour.layer.shadowOpacity = 1.0
        manageTour.layer.shadowRadius = 0.0
        manageTour.layer.masksToBounds = false
        manageTour.layer.cornerRadius = 4.0
        manageTour.layer.shadowRadius = 5
        
        //iPad Pro 12.9
        if view.frame.width == 1024 {
            mangeTourButtonWidth.constant = 70
            manageTourTop.constant = 30
            manageTourTrailing.constant = 30
        }
        
        //iPad Pro 10.5
        if view.frame.width == 834 {
            mangeTourButtonWidth.constant = 65
            manageTourTop.constant = 30
            manageTourTrailing.constant = 30
            
        }
        
        if view.frame.width == 768 {
            mangeTourButtonWidth.constant = 55
            manageTourTop.constant = 20
            manageTourTrailing.constant = 20
            
        }

        super.viewDidLoad()
        
        let artwork = Artwork(title: "",
                              locationName: "",
                              discipline: "",
                              coordinate: CLLocationCoordinate2D(latitude: 21.282778, longitude: -157.829444))
        
        mapView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        if let currentUser = PFUser.current() {
            let query = PFQuery(className: "Tour")
            //filter query by user
            query.whereKey("user", equalTo: currentUser)
            //if something is a pointer, this gives all the information for that pfobject
            query.includeKey("venue")
            
            query.findObjectsInBackground { (objects, error) in
                if let theObjects = objects {
                    self.tours = theObjects
                    self.mapView.removeAnnotations(self.mapView.annotations)
                    for aVenue in theObjects {
                        let obj = aVenue.object(forKey: "venue") as? PFObject
                        if let name = obj?.object(forKey: "name") as? String, let coordinate = obj?.object(forKey: "venueLocation") as? PFGeoPoint, let capacity = obj?.object(forKey: "capacity") as? Int {
                            let aArtWork = Artwork(title: name, locationName: "Capacity \(capacity)", discipline: "", coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
                            aArtWork.tour = aVenue
                            self.mapView.addAnnotation(aArtWork)
                        }
                    }
                    self.mapView.showAnnotations(self.mapView.annotations, animated: true)
                }
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if PFUser.current() == nil {
            if let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeViewController {
                let loginNavigation = UINavigationController(rootViewController: welcomeVC)
                self.present(loginNavigation, animated: true, completion: nil)
            }
        }
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 5000.0, regionRadius * 5000.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let tour = (view.annotation as? Artwork)?.tour {
            if let detailVC = storyboard?.instantiateViewController(withIdentifier: "tourVenueDetail") as? TourVenueDetailsTableViewController {
                detailVC.tour = tour
                navigationController?.pushViewController(detailVC, animated: true)
            }

        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


