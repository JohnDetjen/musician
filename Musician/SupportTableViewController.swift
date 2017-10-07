//
//  SupportTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/25/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import MessageUI

class SupportTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gilroy-Light", size: 18)!]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !UserDefaults.standard.bool(forKey: "purchased") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                if let buyVC = self.storyboard?.instantiateViewController(withIdentifier: "MusicianBookingPlus") as? MusicianBookingPlusViewController {
                    buyVC.delegate = self
                    self.present(buyVC, animated: true, completion: nil)
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("How to Book Your Band So You'll Sell Out Every Show")
                mail.setMessageBody("<b>Quick Tip</b></br></br>Book yourself in a venue that is too small for you and your fans. Think smaller.</br></br>“Sold out” has a certain ring to it, and some well-placed “sold-out” shows can go a long way.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 1 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("How to Transition from Open Mics to Longer Gigs")
                mail.setMessageBody("<b>Quick Tips</b></br></br>1. Play weekly at the open mics.</br></br>2. Build your email list from the beginning.</br></br>3. Announce your name at the beginning and end of your open mic set.</br></br>4. Stay for the whole open mic and make friends.</br></br>5. Get to know the staff at the venue, and ask if you can join a bill as a support act.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 2 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("Filling an Out-of-Town Music Club with Fans")
                mail.setMessageBody("<b>Quick Tips</b></br></br>1. Forge relationships with bands in other cities.</br></br>2. Look for the smaller, quality venues.</br></br>3. Advertise your show on Facebook</br></br>4. Be active on blogs and forums that focus on your target market.</br></br>5. Don’t forget the usual promo stuff.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 3 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("Make Your Own DIY Venue for One Night")
                mail.setMessageBody("<b>Quick Tip</b></br></br>You can turn any space into a venue.</br></br>Here is a list of non-traditional venues:</br></br>Church, park, restaurant, movie theater, clothing store, bookstore, tented stage in parking lot, busking on the street, coffee shop, art gallery, backyard, basement, a boat, warehouse, corporate party, hotel room, record store, guitar shop.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }

        else if indexPath.row == 4 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("How to Design Your Ideal Performance Venue")
                mail.setMessageBody("<b>Quick Tips</b></br></br>1. Know your audience.</br></br>2. Think like a business owner</br></br>3.Do your own ticketing</br></br>4. Team up with a venue and learn about any options you have for bringing in lighting, visuals, or any other set design materials.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }

        else if indexPath.row == 5 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("Play In-Studios and In-Store Performances")
                mail.setMessageBody("<b>Quick Tip</b></br></br>Book performances at radio stations and record stores to support each venue performance.  Make sure to schedule these after you have a show booked so you can cross promote for each event.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 0 && indexPath.section == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Gig Support <john@joinmusician.com>"])
                mail.setSubject("How to Make a Stage Plot and Input List")
                mail.setMessageBody("<b>Quick Tips</b></br></br>A stage plot is a graphic representation that illustrates your band’s setup when you perform live, your placement on stage, what gear you use, and some other helpful information. Be sure to include:</br></br>1. A basic visual that shows where each member is positioned on stage.</br></br>2. The names of each member and what instruments they play.</br></br>3. How many mics, DIs, monitors, and cables (XLRs or 1/4 inch) you’ll need the venue to provide.</br></br>4. What sound gear (DIs, mics, etc), if any, you’ll be providing.</br></br>5. Whether or not bass and keyboard amplifiers have balanced outputs. Will they be mic’d or run direct?</br></br>6. Where the amps will be placed in relation to the players.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 1 && indexPath.section == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Gig Support <john@joinmusician.com>"])
                mail.setSubject("How to Properly Advance Your Next Show")
                mail.setMessageBody("<b>Quick Tip</b></br></br>Advancing a show means confirming, in “advance”, all of the details surrounding your gig with a venue contact.</br></br>Once you’ve confirmed your show, the booker should send you a contract or email with all the necessary show details. If they don’t, ask for the info yourself.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 2 && indexPath.section == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Gig Support <john@joinmusician.com>"])
                mail.setSubject("Selling More Merch at Shows")
                mail.setMessageBody("<b>Quick Tips</b></br></br>1. Step up Your Presentation</br></br>2. Give Them Payment Options</br></br>3. Sell More than just CDs</br></br>4. Sell From the Stage", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 3 && indexPath.section == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Gig Support <john@joinmusician.com>"])
                mail.setSubject("Summer Touring Checklist")
                mail.setMessageBody("<b>Quick Tip</b></br></br>1. Mail Posters to clubs 6 weeks in advance.</br></br>2.Plan transportation far enough in advance to get vehicle serviced</br></br>3. Plan your days in advance.</br></br>4. Bring extras of everything: strings, cables, mics, picks, sticks, etc.</br></br>5. Know in advance where you’re staying each night.</br></br>6. Check in with all the venues a week in advance of your show", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }


    }

    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
  }


extension SupportTableViewController: MusicianBookingPlusViewControllerDelegate {
    func musicianBookingViewControllerDidCancel() {
        self.tabBarController?.selectedIndex = 0
    }
    
    func musicianBookingViewControllerDidPurchase() {
        UserDefaults.standard.set(true, forKey: "purchased")
    }
}

