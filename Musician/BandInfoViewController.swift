//
//  BandInfoViewController.swift
//  Musician
//
//  Created by John Detjen on 6/28/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse

class BandInfoViewController: UIViewController {
    
    @IBOutlet weak var bandNameTextField: UITextField!
    @IBOutlet weak var bandWebsiteTextField: UITextField!
    @IBOutlet weak var bandHometownTextField: UITextField!
    
    
    var bandInfo = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pupulate
        bandNameTextField.text = PFUser.current()?.object(forKey: "bandName") as? String
        bandWebsiteTextField.text = PFUser.current()?.object(forKey: "website") as? String
        bandHometownTextField.text = PFUser.current()?.object(forKey: "hometown") as? String
        
    }
    
    @IBAction func switchAccountPressed(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            if let theError = error {
                // There was an error logging you out
            }
            else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if let bandName = bandNameTextField.text {
            PFUser.current()?.setValue(bandName, forKey: "bandName")
        }
        if let website = bandWebsiteTextField.text {
            PFUser.current()?.setValue(website, forKey: "website")
        }
        if let hometown = bandHometownTextField.text {
            PFUser.current()?.setValue(hometown, forKey: "hometown")
        }
        PFUser.current()?.saveInBackground(block: { (success, error) in
            if success {
                self.navigationController?.popViewController(animated: true)
            }
        })
        
    }
}
