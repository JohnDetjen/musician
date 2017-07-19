//
//  BookingTemplatesTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/18/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import MessageUI
import Parse

class BookingTemplatesTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var firstBookingRequest: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bandName = PFUser.current()?.object(forKey: "bandName") as! String
        let hometown = PFUser.current()?.object(forKey: "hometown") as! String
        let website = PFUser.current()?.object(forKey: "website") as! String
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([""])
                    mail.setSubject("Hold Request: \(bandName)")
                    mail.setMessageBody("I manage \(bandName).</br>\(website)</br></br> We have a 15 date tour starting from \(hometown).  </br></br>We would like to place a hold if you have availability this upcoming month. </br></br>Thank you and take care.</br></br>\(bandName)", isHTML: true)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                }
            }
            else if indexPath.row == 1 {
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([""])
                    mail.setSubject("Hold Request: \(bandName)")
                    mail.setMessageBody("Checking back for \(bandName).</br>\(website)</br></br>We would like to place a hold if you have availability this upcoming month. A 2nd or 3rd hold would work as well.</br></br>Thanks.</br></br>\(bandName)", isHTML: true)
                    present(mail, animated: true, completion: nil)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                    // give feedback to the user
                }
            }
            else if indexPath.row == 2 {
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([""])
                    mail.setSubject("Hold Request: \(bandName)")
                    mail.setMessageBody("Checking back for \(bandName).</br>\(website)</br></br>Please let me know if there is availabilty this month.</br></br>A 2nd or 3rd hold would work as well.</br></br>Thanks.</br></br>\(bandName)", isHTML: true)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                    // give feedback to the user
                }
                
            }
            else if indexPath.row == 3 {
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([""])
                    mail.setSubject("Confirmed: \(bandName)")
                    mail.setMessageBody("That works great.</br></br>Let me know what you have in mind for ticket price, support, door time, and bill payout.</br></br>Is there any additional info you need at the moment? </br></br>Thank you.</br></br>\(bandName)", isHTML: true)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                    // give feedback to the user
                }
                
            }
            else if indexPath.row == 4 {
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([""])
                    mail.setSubject("Trade Show: \(bandName)")
                    mail.setMessageBody("I manage \(bandName)</br>\(website)</br></br>We are very interested in trading a show with you.  We play regularly in \(hometown).</br></br>Let me know if you are planning on coming to \(hometown), and would like to discuss further.</br></br>Thanks!</br></br>\(bandName)", isHTML: true)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                    // give feedback to the user
                }
                
            }
            else if indexPath.row == 5 {
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    mail.setToRecipients([""])
                    mail.setSubject("Input List: \(bandName)")
                    mail.setMessageBody("Here is the input list for \(bandName):</br></br>Band Members: 3</br>Vocals: SM 58 beta</br>Guitar: Electric Guitar, Fender Twin-Reverb Amp </br>Keyboards: Kurzweil PC2x, MOOG lil Phatty, Kaossilator (Korg)</br>Drums: Yamaha Pro V Stroke Kit, Ludwig 5x14 black beauty Snare, Paiste high-hat, Sabian Crash</br></br>Inputs needed: Approximately 9 inputs plus drum mics (house drum mics if available)</br></br>Also, if possible, we would like to record the show through our own computer and pro tools software.  We hope that we will be able to feed a stereo quarter inch out from the main mixer to our ProTools Rack.  </br></br>Thank you</br>\(bandName)", isHTML: true)
                    present(mail, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                    // give feedback to the user
                }
                
            }
        }
        
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                if let radioCampaignOverviewVC = storyboard?.instantiateViewController(withIdentifier: "radioCampaignOverview") as? RadioCampaignOverviewViewController {
                    navigationController?.pushViewController(radioCampaignOverviewVC, animated: true)
                }
            }
            if indexPath.row == 1 {
                if let sampleOneSheetVC = storyboard?.instantiateViewController(withIdentifier: "sampleOneSheet") as? SampleOneSheetViewController {
                    navigationController?.pushViewController(sampleOneSheetVC, animated: true)
                }
            }
            if indexPath.row == 2 {
                if let samplePackagingVC = storyboard?.instantiateViewController(withIdentifier: "samplePackaging") as? SamplePackagingViewController {
                    navigationController?.pushViewController(samplePackagingVC, animated: true)
                }
            }
            if indexPath.row == 3 {
                if let stepByStepPreparationVC = storyboard?.instantiateViewController(withIdentifier: "stepByStepPreparation") as? StepByStepPreparationViewController {
                    navigationController?.pushViewController(stepByStepPreparationVC, animated: true)
                }
            }
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
