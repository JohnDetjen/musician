//
//  UserListTableViewController.swift
//  Musician
//
//  Created by John Detjen on 10/16/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import SafariServices
import MapKit

class UserListTableViewController: UITableViewController {
    
    var users = [PFObject]()
    var imageFiles = [PFFile]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gilroy-Light", size: 18)!]
        
        loadData()

    }

    
    func loadData() {
        let query = PFUser.query()
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
        cell.delegate = self
        cell.user = user as? PFUser
        cell.bandNameLabel.text = user.object(forKey: "bandName") as? String
        cell.hometownLabel.text = user.object(forKey: "hometown") as? String
        cell.websiteLabel.text = user.object(forKey: "website") as? String
        
        //cell.spotifyButton.addTarget(self, action: #selector(self.spotifyButtonPressed(_:)), for: .touchUpInside)
        return cell
    }
    
//    func spotifyButtonPressed (_ sender: Any) {
//
//        let spotifyButton = sender as? UIButton
//
//
////        let user = tableView.cellForRow(at: indexPath)
////
////        if var website = user.object(forKey: "spotify") as? String {
////            if !(website.contains("http://") || website.contains("https://")) {
////                website = "http://" + website
////            }
////            if let url = URL(string: website) {
////                let svc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
////                self.present(svc, animated: true, completion: nil)
////            }
////        }
//
//    }
}

extension UserListTableViewController: UserListTableViewCellDelegate {
    
    // Open spotify link goes here
    func userListTableViewCell(cell: UserListTableViewCell, didPressSpotifyButton: UIButton) {
        if var website = cell.user?.object(forKey: "spotify") as? String {
            if !(website.contains("http://") || website.contains("https://")) {
                website = "http://" + website
            }
            if let url = URL(string: website) {
                let svc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                self.present(svc, animated: true, completion: nil)
            }
        }
    }
}
