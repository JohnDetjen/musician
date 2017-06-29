//
//  SettingsTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/19/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse

class SettingsTableViewController: UITableViewController {
    
    var bandInfo = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "User")
        query.whereKey("user", equalTo: PFUser.current()!)
        
        query.findObjectsInBackground { (objects, error) in
            if let theObjects = objects {
                self.bandInfo = theObjects
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bandcell", for: indexPath)
        
        let bandName = PFUser.current()?.object(forKey: "bandName") as! String
        let hometown = PFUser.current()?.object(forKey: "hometown") as! String
        let website = PFUser.current()?.object(forKey: "website") as! String
        
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Band"
            cell.detailTextLabel?.text = bandName
        }
            
        else if indexPath.row == 1 {
            cell.textLabel?.text = "Website"
            cell.detailTextLabel?.text = website
        }
            
        else if indexPath.row == 2 {
            cell.textLabel?.text = "City"
            cell.detailTextLabel?.text = hometown
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let bandName = PFUser.current()?.object(forKey: "bandName") as! String
//        let hometown = PFUser.current()?.object(forKey: "hometown") as! String
//        let website = PFUser.current()?.object(forKey: "website") as! String
//
//    }
}
