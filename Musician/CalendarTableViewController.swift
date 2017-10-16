//
//  CalendarTableViewController.swift
//  Musician
//
//  Created by John Detjen on 10/2/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse

class CalendarTableViewController: UITableViewController {
    var tasks = [PFObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gilroy-Light", size: 18)!]
        
        loadData()
        
    }

    
    //load data
    func loadData() {
        let query = PFQuery(className: "DailyTasks")
        query.limit = 1000
        query.findObjectsInBackground { (objects, error) in
            if let theObjects = objects {
                self.tasks = theObjects
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskcell", for: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]
        if let userId = PFUser.current()?.objectId {
            if (task.object(forKey: "users") as? [String])?.contains(userId) == true {
                cell.taskImage.isHighlighted = true
            }
            else {
                cell.taskImage.isHighlighted = false
            }
        }
        cell.taskLabel.text = task.object(forKey: "Task") as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]
        cell.taskImage.isHighlighted = !cell.taskImage.isHighlighted
        if let userId = PFUser.current()?.objectId {
            if cell.taskImage.isHighlighted {
                task.addUniqueObject(userId, forKey: "users")
            }
            else {
                task.remove(userId, forKey: "users")
            }
            task.saveEventually()
        }
        
    }


   
}
