//
//  ManageTourTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/21/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse

class ManageTourTableViewController: UITableViewController {
    
    var tours = [PFObject]()
//    var venues = [PFObject]()
//    var userVenues = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "Tour")
        //filter query by user
        query.whereKey("user", equalTo: PFUser.current()!)
        //if something is a pointer, this gives all the information for that pfobject
        query.includeKey("venue")
        
        
        query.findObjectsInBackground { (objects, error) in
            if let theObjects = objects {
                self.tours = theObjects
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tours.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let individualTour = tours[indexPath.row]
        if let showDate = individualTour.object(forKey: "date") as? Date {
            let dateFormatMachine = DateFormatter()
            dateFormatMachine.dateFormat = "MM/dd/yy"
            cell.detailTextLabel?.text = dateFormatMachine.string(from: showDate)
            // theVenue is a PFObject of class Venue
            if let theVenue = individualTour.object(forKey: "venue") as? PFObject {
                if let venueName = theVenue.object(forKey: "name") as? String {
                    cell.textLabel?.text = venueName
                }
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tour = tours[indexPath.row]
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "tourVenueDetail") as? TourVenueDetailsTableViewController {
            detailVC.venue = tour.object(forKey: "venue") as? PFObject
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
