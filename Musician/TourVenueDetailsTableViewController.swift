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
import MBProgressHUD

class TourVenueDetailsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var contactLabel: UILabel!

    @IBOutlet weak var capacityLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var websiteLabel: UILabel!

    @IBOutlet weak var bookingLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    
    var tour: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let venue = tour?.object(forKey: "venue") as? PFObject
        contactLabel.text = venue?.object(forKey: "contactEmail") as? String
        phoneLabel.text = venue?.object(forKey: "phoneNumber") as? String
        websiteLabel.text = venue?.object(forKey: "website") as? String
        
        if let capacityInt = venue?.object(forKey: "capacity") as? Int {
            capacityLabel.text = "\(capacityInt)"
        }
        bookingLabel.text = tour?.object(forKey: "status") as? String ?? "Not Booked"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        
        
        let datePicker = UIDatePicker()
        if let date = tour?.object(forKey: "date") as? Date {
            dateLabel.text = dateFormatter.string(from: date)
            datePicker.date = date
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if bookingLabel.text == "Not Booked" {
            self.statusImage.image = #imageLiteral(resourceName: "unbooked")
        }
        if bookingLabel.text == "Booked" {
            self.statusImage.image = #imageLiteral(resourceName: "booked")
        }
        if bookingLabel.text == "Hold" {
            self.statusImage.image = #imageLiteral(resourceName: "hold")
        }
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 && indexPath.section == 0 {
            let alert = UIAlertController(title: "Select Show Status" as String, message: "" as String, preferredStyle: UIAlertControllerStyle.actionSheet)
            let notBookedAction = UIAlertAction(title: "Not Booked", style: .default, handler: { (action) in
                self.bookingLabel.text = action.title
                self.tour?.setObject("Not Booked", forKey: "status")
                self.statusImage.image = #imageLiteral(resourceName: "unbooked")
                self.tour?.saveInBackground()
            })
            let holdAction = UIAlertAction(title: "Hold", style: .default, handler: { (action) in
                self.bookingLabel.text = action.title
                self.tour?.setObject("Hold", forKey: "status")
                self.statusImage.image = #imageLiteral(resourceName: "hold")
                self.tour?.saveInBackground()
            })
            let bookedAction = UIAlertAction(title: "Booked", style: .default, handler: { (action) in
                self.bookingLabel.text = action.title
                self.tour?.setObject("Booked", forKey: "status")
                self.statusImage.image = #imageLiteral(resourceName: "booked")
                self.tour?.saveInBackground()
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(notBookedAction)
            alert.addAction(holdAction)
            alert.addAction(bookedAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        else if indexPath.row == 0 && indexPath.section == 2 {
            MBProgressHUD.showAdded(to: view, animated: true)
            tour?.deleteInBackground(block: { (success, error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if success {
                    self.navigationController?.popViewController(animated: true)
                }
            })
        }
        
        
//        if indexPath.row == 1 && indexPath.section == 0  {
//            if let email = venue.object(forKey: "contactEmail") as? String {
//                if MFMailComposeViewController.canSendMail() {
//                    let mail = MFMailComposeViewController()
//                    let venue = venue.object(forKey: "name") as! String
//                    let bandName = PFUser.current()?.object(forKey: "bandName") as! String
//                    let hometown = PFUser.current()?.object(forKey: "hometown") as! String
//                    let website = PFUser.current()?.object(forKey: "website") as! String
//                    mail.mailComposeDelegate = self
//                    mail.setToRecipients([email])
//                    mail.setSubject("Hold Request: \(venue)")
//                    mail.setMessageBody("\(venue), I manage \(bandName). \(website). \nWe have a 15 date tour starting from \(hometown).  We would like to place a hold on \(venue) if you have availability this upcoming month. <b>I hope to talk further about setting something up. Thank you and take care. Cheers.</b>", isHTML: true)
//                    present(mail, animated: true, completion: nil)
//                } else {
//                    print("Cannot send mail")
//                }
//            }
//        }
        
    }
    //
    //    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    //        controller.dismiss(animated: true)
    //    }
}
