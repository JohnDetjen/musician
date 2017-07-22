//
//  AddStationTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/26/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import SCLAlertView

class AddStationTableViewController: UITableViewController {

    @IBOutlet weak var stationName: UITextField!
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var mailingAddress: UITextField!
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var stateName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if let stationName = stationName.text, let contactName = contactName.text, let phoneNumber = phoneNumber.text, let mailingAddress = mailingAddress.text, let cityName = cityName.text, let stateName = stateName.text {
            let station = PFObject(className: "RadioStation")
            
            station.setObject(stationName, forKey: "stationName")
            station.setObject(contactName, forKey: "contact")
            station.setObject(phoneNumber, forKey: "phoneNumber")
            station.setObject(mailingAddress, forKey: "address")
            station.setObject(cityName, forKey: "cityName")
            station.setObject(stateName, forKey: "stateName")
            
            station.saveInBackground()
        }
        
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "HereNowAlertController") //Replace the IconImage text with the image name
        alertView.showInfo("Station Submitted", subTitle: "\nThank you for the submission.  It can take up to one hour to approve.", circleIconImage: alertViewIcon)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}
