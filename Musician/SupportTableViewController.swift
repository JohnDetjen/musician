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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["john@joinmusician.com"])
                mail.setSubject("Tour Support")
                mail.setMessageBody("", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        else if indexPath.row == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["john@joinmusician.com"])
                mail.setSubject("Radio Campaign Support")
                mail.setMessageBody("", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }

    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
  }
