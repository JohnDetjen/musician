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
    
    var tour: PFObject?
    var venue: PFObject?
    
    let regionRadius: CLLocationDistance = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        venue = tour?.object(forKey: "venue") as? PFObject
        if let date = tour?.object(forKey: "date") as? Date {
            datePicker.date = date
        }
        if tour == nil {
            tour = PFObject(className: "Tour")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        centerMap()
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
        
        if let theVenue = venue, let user = PFUser.current() {
            tour?.setObject(theVenue, forKey: "venue")
            tour?.setObject(user, forKey: "user")
            tour?.setObject(datePicker.date, forKey: "date")
            MBProgressHUD.showAdded(to: view, animated: true)
            tour?.saveInBackground(block: { (success, error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if success {
                    let appearance = SCLAlertView.SCLAppearance(
                        showCircularIcon: true
                    )
                    let alertView = SCLAlertView(appearance: appearance)
                    let alertViewIcon = UIImage(named: "HereNowAlertController") //Replace the IconImage text with the image name
                    alertView.showInfo("Tour Updated", subTitle: "\nGo to your tour map and start booking venues!", circleIconImage: alertViewIcon)
                    let _ = self.navigationController?.popViewController(animated: true)
                }
                else {
                    print("there was an error saving the tour")
                }
            })
        }
    }

}
