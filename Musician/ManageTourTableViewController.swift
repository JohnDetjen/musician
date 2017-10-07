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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        return tours.count + 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddVenueCell", for: indexPath)
            cell.textLabel?.text = "Add venue to tour"
            cell.textLabel?.textAlignment = .center
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let individualTour = tours[indexPath.row - 1]
        
        if let showStatus = individualTour.object(forKey: "status") as? String {
            if individualTour.object(forKey: "status") as? String == "Booked" {
                cell.imageView?.image = #imageLiteral(resourceName: "booked")
            }
            if individualTour.object(forKey: "status") as? String == "Hold" {
                cell.imageView?.image = #imageLiteral(resourceName: "hold")
            }
        }
        
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
        
        if indexPath.row == 0 {
            if let venueDetailVC = storyboard?.instantiateViewController(withIdentifier: "venueContacts") as? ContactsTableViewController {
                navigationController?.pushViewController(venueDetailVC, animated: true)
            }
        }
            
        else {
            let tour = tours[indexPath.row - 1]
            if let detailVC = storyboard?.instantiateViewController(withIdentifier: "tourVenueDetail") as? TourVenueDetailsTableViewController {
                detailVC.tour = tour
                navigationController?.pushViewController(detailVC, animated: true)
            }
            
        }
        
    }
}
