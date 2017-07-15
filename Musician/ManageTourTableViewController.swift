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
    @IBOutlet weak var emailVenuesButton: UIButton!
    
    var tours = [PFObject]()
//    var venues = [PFObject]()
//    var userVenues = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        emailVenuesButton.layer.cornerRadius = 5
//        emailVenuesButton.clipsToBounds = true
        
        
        let query = PFQuery(className: "Tour")
        //filter query by user
        query.whereKey("user", equalTo: PFUser.current()!)
        //if something is a pointer, this gives all the information for that pfobject
        query.includeKey("venue")
        
        
        query.findObjectsInBackground { (objects, error) in
            if let theObjects = objects {
                self.tours = theObjects.sorted(by: { (o1, o2) -> Bool in
                    guard let date1 = o1.object(forKey: "date") as? Date else {
                        return false
                    }
                    guard let date2 = o2.object(forKey: "date") as? Date else {
                        return true
                    }
                    return date1.compare(date2) == .orderedAscending
                })
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
            detailVC.tour = tour
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
