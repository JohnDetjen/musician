//
//  ContactsTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/14/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse

class ContactsTableViewController: UITableViewController {
    
    var cities = [PFObject]()
    var allCities = [PFObject]()
    var states = [String]()
    @IBOutlet weak var searchBar: UISearchBar!
    var searchQuery = PFQuery(className: "City")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    func loadData() {
        let query = PFQuery(className: "City")
        query.findObjectsInBackground { (objects, error) in
            if let theObjects = objects {
                self.cities = theObjects
                self.allCities = theObjects
                self.filterStatesFromCities()
                self.tableView.reloadData()
            }
        }
    }
    
    func filterStatesFromCities() {
        states = cities.map({ (object) -> String in
            if let state = object.object(forKey: "stateName") as? String {
                return state
            }
            return ""
        })
        states = Array(Set(states))
    }

    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return states.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let state = states[section]
        let cityArray = cities.filter { (city) -> Bool in
            return city.object(forKey: "stateName") as? String == state
        }
        
        return cityArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let state = states[indexPath.section]
        let cityArray = cities.filter { (city) -> Bool in
            return city.object(forKey: "stateName") as? String == state
        }
        let city = cityArray[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = city.object(forKey: "cityName") as? String
        var numberOfVenues = 0
        if let number = city.object(forKey: "venueNumber") as? Int {
            numberOfVenues = number
        }
        cell.detailTextLabel?.text = "\(numberOfVenues) venues"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return states[section]
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let venueDetailVC = storyboard?.instantiateViewController(withIdentifier: "venueDetail") as? VenueDetailsTableViewController {
            let state = states[indexPath.section]
            let cityArray = cities.filter { (city) -> Bool in
                return city.object(forKey: "stateName") as? String == state
            }
            let city = cityArray[indexPath.row]
            venueDetailVC.city = city
            navigationController?.pushViewController(venueDetailVC, animated: true)
        }
    }
}

extension ContactsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchQuery.cancel()
        if searchText.isEmpty {
            cities = allCities
            filterStatesFromCities()
            self.tableView.reloadData()
        }
        else {
            cities = allCities.filter({ (city) -> Bool in
                if let cityName = city.object(forKey: "cityName") as? String {
                    
                    let cityNameArray = cityName.components(separatedBy: " ")
                    for name in cityNameArray {
                        if name.substring(to: searchText.endIndex).lowercased() == searchText.lowercased() {
                            return true
                        }
                    }
                }
                return false
            })
            self.filterStatesFromCities()
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        cities = allCities
        filterStatesFromCities()
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

}











