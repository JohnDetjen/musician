//
//  VenuesTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/15/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import SCLAlertView

class AddVenueTableViewController: UITableViewController {
    @IBOutlet weak var venueNameTextField: UITextField!
    @IBOutlet weak var contactEmail: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var website: UITextField!
    @IBOutlet weak var capacityNumber: UITextField!
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var stateName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        self.venueNameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        if let venueName = venueNameTextField.text, let contactEmail = contactEmail.text, let phoneNumber = phoneNumber.text, let website = website.text, let capacityNumber = capacityNumber.text, let cityName = cityName.text, let stateName = stateName.text {
            let venue = PFObject(className: "Venue")
            
            venue.setObject(venueName, forKey: "name")
            venue.setObject(contactEmail, forKey: "contactEmail")
            venue.setObject(phoneNumber, forKey: "phoneNumber")
            venue.setObject(website, forKey: "website")
            venue.setObject(capacityNumber, forKey: "capacityInput")
            venue.setObject(cityName, forKey: "cityName")
            venue.setObject(stateName, forKey: "stateName")
            
            venue.saveInBackground()
        }
        
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "HereNowAlertController") //Replace the IconImage text with the image name
        alertView.showInfo("Venue Submitted", subTitle: "\nThank you for the submission.  It can take up to one hour to approve.", circleIconImage: alertViewIcon)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
}
