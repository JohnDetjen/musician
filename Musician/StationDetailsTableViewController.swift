//
//  StationDetailsTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/20/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import MessageUI
import SafariServices

class StationDetailsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    var venues = [PFObject]()
    var city: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    func loadData() {
        if let theCity = city {
            let query = PFQuery(className: "RadioStation")
            query.whereKey("city", equalTo: theCity)
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
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let venue = venues[section]
        return venue.object(forKey: "stationName") as? String
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddStationCell", for: indexPath)
            cell.textLabel?.text = "Add Station To My Tour"
            cell.textLabel?.textAlignment = .center
            return cell
        }
        
        let venue = venues[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationCell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Contact:"
            cell.detailTextLabel?.text = venue.object(forKey: "contact") as? String
        case 1:
            cell.textLabel?.text = "Phone:"
            cell.detailTextLabel?.text = venue.object(forKey: "phoneNumber") as? String
        case 2:
            cell.textLabel?.text = "Address:"
            cell.detailTextLabel?.text = venue.object(forKey: "address") as? String
//        case 3:
//            cell.textLabel?.text = "Capacity:"
//            var capacity = 0
//            if let theCapacity = venue.object(forKey: "capacity") as? Int {
//                capacity = theCapacity
//            }
//            cell.detailTextLabel?.text = String(capacity)
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
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([email])
                    mail.setSubject("Booking Request: \(venue)")
                    mail.setMessageBody("\(venue), I manage (BAND NAME). (WEBSITE TO HEAR BAND'S MUSIC). \nWe have a 15 date tour starting from (HOMETOWN) this (DATE).  We are hoping for the opportunity to show (VENUE NAME) that we can bring a great crowd, and play a great set of music. \nWe have a strong following in (VENUE CITY), along with friends and family. <b>I hope to talk further about setting something up. Thank you and take care. Cheers.</b>", isHTML: true)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                }
            }
            //        case 1:
            //
            //        case 2:
            //            if let url = venue.object(forKey: "website") as? String {
            //            let svc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            //            self.present(svc, animated: true, completion: nil)
            //        }
            
            //        case 3:
            //
            //        case 4:
        //
        default:
            print("Panic!!")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
