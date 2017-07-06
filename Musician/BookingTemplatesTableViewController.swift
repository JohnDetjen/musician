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
                    mail.setSubject("Hold Request:")
                    mail.setMessageBody("I manage \(bandName). \(website). \n We have a 15 date tour starting from \(hometown).  We would like to place a hold if you have availability this upcoming month. <b>Thank you and take care. Cheers.</b>", isHTML: true)
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
                    mail.setSubject("Hold Request:")
                    mail.setMessageBody("Checking back. \(website). We would like to place a hold if you have availability this upcoming month. A 2nd or 3rd hold would work as well.<b>Thanks.</b>", isHTML: true)
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
                    mail.setSubject("Hold Request:")
                    mail.setMessageBody("Checking back. \(website). Please let me know if there is availabilty this month. A 2nd or 3rd hold would work as well.<b>Thanks.", isHTML: true)
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
                    mail.setSubject("Confirmed")
                    mail.setMessageBody("That works great. Ticket Price, Support, Door Time, Bill Payout? Is there any info you need at the moment? Thank you. Cheers", isHTML: true)
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
                    mail.setSubject("Trade Show:")
                    mail.setMessageBody("How are you?  I was looking through bands in (TRADE CITY) to find a match for our band (BAND NAME) to set up a show together.  Your band, (TRADE BAND NAME) definitely matches up with our style of music.  We are very interested in trading a show.  We play regularly at (VENUE YOU PLAY IN HOMETOWN) and (ANOTHER HOMETOWN VENUE), two very respected venues in (HOMETOWN).  It would be very easy for us to set up a show with very little time in advance. If you are interested, we can have the show in (HOMETOWN) before we come to (TRADE CITY). Let us know!Cheers", isHTML: true)
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
                    mail.setSubject("Input List:")
                    mail.setMessageBody("Here is the input list for (BAND NAME) (3) Band Members:(2) Vocal mics- SM 58 betaElectric Guitar, Fender Twin-Reverb Amp Keyboards:Kurzweil PC2x,MOOG Lil phatty,Kaossilator (Korg)Drums:Yamaha Pro V Stroke Kit, Ludwig 5x14 black beauty Snare, Paiste high-hat, regular, Sabian Crash, Zidian Splash, Zidian China, Inputs needed: Approximately 9 inputs plus drum mics (house drum mics if available), Also, we would like to record the show through our own computer and pro tools software.  We hope that we will be able to feed a stereo quarter inch out from the main mixer to our ProTools Rack.  Thank you, Cheers", isHTML: true)
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
