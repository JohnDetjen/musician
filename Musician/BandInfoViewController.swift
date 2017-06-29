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
        
        if let bandName = bandNameTextField.text, let website = bandWebsiteTextField.text, let hometown = bandHometownTextField.text {
            
            // Defining the user object
            let user = PFUser()
            user["bandName"] = bandName
            user["website"] = website
            user["hometown"] = hometown
            
        }
        
        //        let query = PFQuery(className: "User")
        //        query.whereKey("user", equalTo: PFUser.current()!)
        //
        //        query.findObjectsInBackground { (objects, error) in
        //            if let theObjects = objects {
        //                self.bandInfo = theObjects
        ////                self.view.reloadData()
        //            }
        //    }
    }
    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
}
