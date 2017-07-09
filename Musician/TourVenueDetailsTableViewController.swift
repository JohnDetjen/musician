//
//  TourVenueDetailsTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/28/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import MessageUI
import SafariServices

class TourVenueDetailsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var contactLabel: UILabel!

    @IBOutlet weak var capacityLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var websiteLabel: UILabel!

    @IBOutlet weak var bookingLabel: UILabel!
    
    
    var venue: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactLabel.text = venue?.object(forKey: "contactEmail") as? String
        phoneLabel.text = venue?.object(forKey: "phoneNumber") as? String
        websiteLabel.text = venue?.object(forKey: "website") as? String
        
        if let capacityInt = venue?.object(forKey: "capacity") as? Int {
            capacityLabel.text = "\(capacityInt)"
        }
    }
    
    
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alert = UIAlertController(title: "" as String, message: "Show Status" as String, preferredStyle: UIAlertControllerStyle.actionSheet)
            alert.addAction(UIAlertAction(title: "Not Booked", style: UIAlertActionStyle.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Hold", style: UIAlertActionStyle.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Booked", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if indexPath.row == 1 {
//            let venueInfo = PFObject(className: "Tour")
//            
//            venueInfo.setObject(venue, forKey: "venue")
//            if let currentUser = PFUser.current(){
//                venueInfo.setObject(currentUser, forKey: "user")
//            }
            
            if let venueDetailVC = storyboard?.instantiateViewController(withIdentifier: "showDate") as? ShowDateViewController {
                venueDetailVC.venue = venue
                navigationController?.pushViewController(venueDetailVC, animated: true)
            }
            
        }
        
    }
    //
    //    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    //        controller.dismiss(animated: true)
    //    }
}
