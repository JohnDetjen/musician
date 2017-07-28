//
//  StationDetailsTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/20/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import MessageUI
import SafariServices

class StationDetailsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    var venues = [PFObject]()
    var city: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160
        self.title = city?.object(forKey: "cityName") as? String
                
    }
    
    func loadData() {
        if let theCity = city {
            let query = PFQuery(className: "RadioStation")
            query.whereKey("city", equalTo: theCity)
            query.findObjectsInBackground { (objects, error) in
                if let theObjects = objects {
                    self.venues = theObjects
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return venues.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let venue = venues[section]
        return venue.object(forKey: "stationName") as? String
    }
    
    override func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return (tableView.cellForRow(at: indexPath)?.detailTextLabel?.text) != nil
    }
    
    override func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return action == #selector(copy(_:))
    }
    
    override func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if action == #selector(copy(_:)) {
            let cell = tableView.cellForRow(at: indexPath)
            let pasteboard = UIPasteboard.general
            pasteboard.string = cell?.detailTextLabel?.text
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddStationCell", for: indexPath)
            cell.textLabel?.text = "Add Station To My Tour"
            cell.textLabel?.textAlignment = .center
            return cell
        }
        
        let venue = venues[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationCell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.selectionStyle = .none
            cell.textLabel?.text = "Contact:"
            cell.detailTextLabel?.text = venue.object(forKey: "contact") as? String
        case 1:
            cell.textLabel?.text = "Phone:"
            cell.detailTextLabel?.text = venue.object(forKey: "phoneNumber") as? String
        case 2:
            cell.selectionStyle = .none
            cell.textLabel?.text = "Address:"
            cell.detailTextLabel?.text = venue.object(forKey: "address") as? String

        default:
            print("Panic!!")
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let venue = venues[indexPath.section]
        
        switch indexPath.row {
            
        case 1:
            if let phoneNumber = venue.object(forKey: "phoneNumber") as? String {
                if let phoneNumberURL = URL(string: "tel://\(phoneNumber.replacingOccurrences(of: ".", with: ""))") {
                    UIApplication.shared.open(phoneNumberURL, options: [:], completionHandler: nil)
                }
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        case 3:
            if let stationDetailVC = storyboard?.instantiateViewController(withIdentifier: "showDate") as? ShowDateViewController {
                stationDetailVC.venue = venue
                navigationController?.pushViewController(stationDetailVC, animated: true)
            }
            
        default:
            print("Panic!!")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
