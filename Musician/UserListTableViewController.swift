//
//  UserListTableViewController.swift
//  Musician
//
//  Created by John Detjen on 10/16/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse

class UserListTableViewController: UITableViewController {
    
    var users = [PFObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gilroy-Light", size: 18)!]
        
        loadData()

    }

    
    func loadData() {
        let query = PFUser.query()
//        let query = PFQuery(className: "DailyTasks")
        query?.limit = 1000
        query?.findObjectsInBackground { (objects, error) in
            if let theObjects = objects {
                self.users = theObjects
                self.tableView.reloadData()
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserListTableViewCell
        let user = users[indexPath.row]
        
        cell.bandNameLabel.text = user.object(forKey: "bandName") as? String


        return cell
    }

}
