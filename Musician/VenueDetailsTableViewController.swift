//
//  VenueDetailsTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/17/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import MessageUI
import SafariServices

class VenueDetailsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    var venues = [PFObject]()
    var city: PFObject?
    var userVenues = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        if let theVenues = PFUser.current()?.object(forKey: "venues") as? [PFObject] {
            userVenues = theVenues
        }
        
    }
    
    func loadData() {
        if let theCity = city {
            let query = PFQuery(className: "Venue")
            //filtering which city
            query.whereKey("city", equalTo: theCity)
            
            query.includeKey("venue")
            
            query.findObjectsInBackground { (objects, error) in
                if let theObjects = objects {
                    self.venues = theObjects
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return venues.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let venue = venues[section]
        return venue.object(forKey: "name") as? String
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddVenueCell", for: indexPath)
            cell.textLabel?.text = "Add Venue To My Tour"
            cell.textLabel?.textAlignment = .center
            return cell

        }
        
        let venue = venues[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Contact:"
            cell.detailTextLabel?.text = venue.object(forKey: "contactEmail") as? String
        case 1:
            cell.textLabel?.text = "Phone:"
            cell.detailTextLabel?.text = venue.object(forKey: "phoneNumber") as? String
        case 2:
            cell.textLabel?.text = "Website:"
            cell.detailTextLabel?.text = venue.object(forKey: "website") as? String
        case 3:
            cell.textLabel?.text = "Capacity:"
            var capacity = 0
            if let theCapacity = venue.object(forKey: "capacity") as? Int {
                capacity = theCapacity
            }
            cell.detailTextLabel?.text = String(capacity)
        default:
            print("Panic!!")
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let venue = venues[indexPath.section]

        switch indexPath.row {
        case 0:
            if let email = venue.object(forKey: "contactEmail") as? String {
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    let venue = venue.object(forKey: "name") as! String
                    let bandName = PFUser.current()?.object(forKey: "bandName") as! String
                    let hometown = PFUser.current()?.object(forKey: "hometown") as! String
                    let website = PFUser.current()?.object(forKey: "website") as! String
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([email])
                    mail.setSubject("Hold Request: \(venue)")
                    mail.setMessageBody("\(venue), I manage \(bandName). \(website). \nWe have a 15 date tour starting from \(hometown).  We would like to place a hold on \(venue) if you have availability this upcoming month. <b>I hope to talk further about setting something up. Thank you and take care. Cheers.</b>", isHTML: true)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                }
            }
//        case 1:
//            if let phoneCallURL = venue.object(forKey: "phoneNumber") as? String {
//                
//                let application:UIApplication = UIApplication.shared
//                if (application.canOpenURL(phoneCallURL)) {
//                    application.open(phoneCallURL, options: [:], completionHandler: nil)
//                }
//            }
//
//        case 2:
//            if let url = venue.object(forKey: "website") as? String {
//            let svc = SFSafariViewController(url: "", entersReaderIfAvailable: true)
//            self.present(svc, animated: true, completion: nil)
//        }

//        case 3:
           
        case 4:
            let venueInfo = PFObject(className: "Tour")
            
            venueInfo.setObject(venue, forKey: "venue")
            if let currentUser = PFUser.current(){
                venueInfo.setObject(currentUser, forKey: "user")
            }
        
            venueInfo.saveInBackground()
            
            if let venueDetailVC = storyboard?.instantiateViewController(withIdentifier: "showDate") as? ShowDateViewController {
                venueDetailVC.showObject = venueInfo
                navigationController?.pushViewController(venueDetailVC, animated: true)
            }
       
        default:
            print("Panic!!")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

