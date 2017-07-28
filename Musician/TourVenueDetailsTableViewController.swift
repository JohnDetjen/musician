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
    var venues = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let venue = tour?.object(forKey: "venue") as? PFObject
        self.title = venue?.object(forKey: "name") as? String
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gilroy-Light", size: 18)!]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let venue = tour?.object(forKey: "venue") as? PFObject
        contactLabel.text = venue?.object(forKey: "contactEmail") as? String
        phoneLabel.text = venue?.object(forKey: "phoneNumber") as? String
        websiteLabel.text = venue?.object(forKey: "website") as? String
        
        if let capacityInt = venue?.object(forKey: "capacity") as? Int {
            capacityLabel.text = "\(capacityInt)"
        }
        bookingLabel.text = tour?.object(forKey: "status") as? String ?? "Not Booked"
        if bookingLabel.text == "Not Booked" {
            self.statusImage.image = #imageLiteral(resourceName: "unbooked")
        }
        if bookingLabel.text ==  "Booked" {
            self.statusImage.image = #imageLiteral(resourceName: "booked")
        }
        if bookingLabel.text == "Hold" {
            self.statusImage.image = #imageLiteral(resourceName: "hold")
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let datePicker = UIDatePicker()
        if let date = tour?.object(forKey: "date") as? Date {
            dateLabel.text = dateFormatter.string(from: date)
            datePicker.date = date
        }
    }
   
    
    override func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return (tableView.cellForRow(at: indexPath)?.detailTextLabel?.text) != nil
    }
    
    override func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return action == #selector(copy(_:))
    }
    
    override func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if action == #selector(copy(_:)) {
            let cell = tableView.cellForRow(at: indexPath)
            let pasteboard = UIPasteboard.general
            pasteboard.string = cell?.detailTextLabel?.text
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let venue = tour?.object(forKey: "venue") as? PFObject
        
        if indexPath.row == 0 && indexPath.section == 1 {
            if let email = venue?.object(forKey: "contactEmail") as? String {
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    let venue = venue?.object(forKey: "name") as! String
                    let bandName = PFUser.current()?.object(forKey: "bandName") as! String
                    let hometown = PFUser.current()?.object(forKey: "hometown") as! String
                    let website = PFUser.current()?.object(forKey: "website") as! String
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([email])
                    mail.setSubject("Hold Request: \(venue)")
                    mail.setMessageBody("I manage \(bandName). </br>\(website). </br></br> We have a 15 date tour starting from \(hometown).  </br></br>We would like to place a hold if you have availability this upcoming month. </br></br>Thank you and take care. </br>Cheers.</br></br>\(bandName)", isHTML: true)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                }
            }
            
        }
        
        if indexPath.row == 1 && indexPath.section == 1 {
            if let phoneNumber = venue?.object(forKey: "phoneNumber") as? String {
                if let phoneNumberURL = URL(string: "tel://\(phoneNumber.replacingOccurrences(of: ".", with: ""))") {
                    UIApplication.shared.open(phoneNumberURL, options: [:], completionHandler: nil)
                    tableView.deselectRow(at: indexPath, animated: true)
                }
            }
        }
        
        if indexPath.row == 2 && indexPath.section == 1 {
            if var website = venue?.object(forKey: "website") as? String {
                if !(website.contains("http://") || website.contains("https://")) {
                    website = "http://" + website
                }
                if let url = URL(string: website) {
                    let svc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                    self.present(svc, animated: true, completion: nil)
                }
            }
        }

        
        if indexPath.row == 0 && indexPath.section == 0 {

            let alert = UIAlertController(title: "Booking Status" as String, message: "Select Your Booking Status" as String, preferredStyle: UIAlertControllerStyle.actionSheet)
            let notBookedAction = UIAlertAction(title: "Not Booked", style: .default, handler: { (action) in
                self.bookingLabel.text = action.title
                self.tour?.setObject("Not Booked", forKey: "status")
                self.statusImage.image = #imageLiteral(resourceName: "unbooked")
                self.tour?.saveInBackground()
                tableView.deselectRow(at: indexPath, animated: true)
            })
            let holdAction = UIAlertAction(title: "Hold", style: .default, handler: { (action) in
                self.bookingLabel.text = action.title
                self.tour?.setObject("Hold", forKey: "status")
                self.statusImage.image = #imageLiteral(resourceName: "hold")
                self.tour?.saveInBackground()
                tableView.deselectRow(at: indexPath, animated: true)
            })
            let bookedAction = UIAlertAction(title: "Booked", style: .default, handler: { (action) in
                self.bookingLabel.text = action.title
                self.tour?.setObject("Booked", forKey: "status")
                self.statusImage.image = #imageLiteral(resourceName: "booked")
                self.tour?.saveInBackground()
                tableView.deselectRow(at: indexPath, animated: true)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(notBookedAction)
            alert.addAction(holdAction)
            alert.addAction(bookedAction)
            alert.addAction(cancelAction)
            tableView.deselectRow(at: indexPath, animated: true)
            
            
            bookedAction.setValue(UIImage(named: "booked")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), forKey: "image")
            notBookedAction.setValue(UIImage(named: "unbooked")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), forKey: "image")
            holdAction.setValue(UIImage(named: "hold")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), forKey: "image")

            self.present(alert, animated: true, completion: nil)
        }
            
        else if indexPath.row == 0 && indexPath.section == 2 {
            MBProgressHUD.showAdded(to: view, animated: true)
            tour?.deleteInBackground(block: { (success, error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if success {
                    self.navigationController?.popViewController(animated: true)
                }
                tableView.deselectRow(at: indexPath, animated: true)
            })
        }
        
        else if indexPath.row == 1 && indexPath.section == 0 {
            if let venueDetailVC = storyboard?.instantiateViewController(withIdentifier: "showDate") as? ShowDateViewController {
                venueDetailVC.tour = tour
                navigationController?.pushViewController(venueDetailVC, animated: true)
            }
        }
        
        
    }
    
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
}
