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
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var checklistWidth: NSLayoutConstraint!
    
    @IBOutlet weak var addVenueTrailing: NSLayoutConstraint!
    @IBOutlet weak var addVenueTop: NSLayoutConstraint!
    @IBOutlet weak var checklistTrailing: NSLayoutConstraint!
    @IBOutlet weak var checklistTop: NSLayoutConstraint!
    @IBOutlet weak var addVenueWidth: NSLayoutConstraint!
    @IBOutlet weak var checklistButton: UIButton!
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
        
        addButton.layer.cornerRadius = 5
        addButton.clipsToBounds = true
        addButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        addButton.layer.shadowOpacity = 1.0
        addButton.layer.shadowRadius = 0.0
        addButton.layer.masksToBounds = false
        addButton.layer.cornerRadius = 4.0
        addButton.layer.shadowRadius = 5
        
        checklistButton.layer.cornerRadius = 5
        checklistButton.clipsToBounds = true
        checklistButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        checklistButton.layer.shadowOpacity = 1.0
        checklistButton.layer.shadowRadius = 0.0
        checklistButton.layer.masksToBounds = false
        checklistButton.layer.cornerRadius = 4.0
        checklistButton.layer.shadowRadius = 5
        
        
        
        
        //iPad Pro 12.9
        if view.frame.width == 1024 {
            mangeTourButtonWidth.constant = 70
            manageTourTop.constant = 30
            manageTourTrailing.constant = 30
            checklistWidth.constant = 70
            checklistTop.constant = 30
            checklistTrailing.constant = 30
            addVenueWidth.constant = 70
            addVenueTop.constant = 30
            addVenueTrailing.constant = 30
            
        }
        
        //iPad Pro 10.5
        if view.frame.width == 834 {
            mangeTourButtonWidth.constant = 65
            manageTourTop.constant = 30
            manageTourTrailing.constant = 30
            checklistWidth.constant = 65
            checklistTop.constant = 30
            checklistTrailing.constant = 30
            addVenueWidth.constant = 65
            addVenueTop.constant = 30
            addVenueTrailing.constant = 30
            
        }
        
        if view.frame.width == 768 {
            mangeTourButtonWidth.constant = 55
            manageTourTop.constant = 20
            manageTourTrailing.constant = 20
            checklistWidth.constant = 55
            checklistTop.constant = 20
            checklistTrailing.constant = 20
            addVenueWidth.constant = 55
            addVenueTop.constant = 20
            addVenueTrailing.constant = 20
            
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
    
//    @IBAction func addNewButtonPressed(_ sender: Any) {
////
//////        let alert = UIAlertController(title: "Add New", message: "Update Your Tour", preferredStyle: .actionSheet)
//////        
////        let venueAction = UIAlertAction(title: "Venue", style: .default, handler: { (action) -> Void in
//            if let venueDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "venueContacts") as? ContactsTableViewController {
//                self.navigationController?.pushViewController(venueDetailVC, animated: true)
//            }
//        })
//
//        let radiostationAction = UIAlertAction(title: "Radio Station", style: .default, handler: { (action) -> Void in
//            if let venueDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "radioContacts") as? RadioContactsTableViewController {
//                self.navigationController?.pushViewController(venueDetailVC, animated: true)
//            }
//        })
        
        
            //        let airbnbAction = UIAlertAction(title: "Place To Sleep", style: .default, handler: { (action) in
            //
            //        })
            //
            //        let recordstoreAction = UIAlertAction(title: "Record Store", style: .default, handler: { (action) in
            //
            //        })
            //
            //        let interviewAction = UIAlertAction(title: "Interview", style: .default, handler: { (action) in
            //
            //        })
//            
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            
//            alert.addAction(venueAction)
//            alert.addAction(radiostationAction)
//            //        alert.addAction(airbnbAction)
//            //        alert.addAction(recordstoreAction)
//            //        alert.addAction(interviewAction)
//            alert.addAction(cancelAction)
//            
//            
//            
//            self.present(alert, animated: true, completion: nil)
//        
//        }
    
    
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


