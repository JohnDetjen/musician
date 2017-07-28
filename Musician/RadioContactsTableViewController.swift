//
//  RadioContactsTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/20/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse

class RadioContactsTableViewController: UITableViewController {

    var cities = [PFObject]()
    var allCities = [PFObject]()
    var states = [String]()
    var dataLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gilroy-Light", size: 18)!]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if dataLoaded {
            if !UserDefaults.standard.bool(forKey: "purchased") {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    if let buyVC = self.storyboard?.instantiateViewController(withIdentifier: "MusicianBookingPlus") as? MusicianBookingPlusViewController {
                        buyVC.delegate = self
                        self.present(buyVC, animated: true, completion: nil)
                    }
                })
            }
        }
    }
    

    
    func loadData() {
        let query = PFQuery(className: "RadioStationCity")
        query.limit = 1000
        query.findObjectsInBackground { (objects, error) in
            if let theObjects = objects {
                self.cities = theObjects
                self.allCities = self.cities
                self.filterStatesFromCities()
                self.tableView.reloadData()
                self.dataLoaded = true
                if !UserDefaults.standard.bool(forKey: "purchased") {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        if let buyVC = self.storyboard?.instantiateViewController(withIdentifier: "MusicianBookingPlus") as? MusicianBookingPlusViewController {
                            buyVC.delegate = self
                            self.present(buyVC, animated: true, completion: nil)
                        }
                    })
                }
            }
        }
    }
    
    
    func filterStatesFromCities() {
        self.states = cities.map({ (object) -> String in
            if let state = object.object(forKey: "stateName") as? String {
                return state
            }
            return ""
        })
        self.states = Array(Set(self.states)).sorted(by: {$0.lowercased() < $1.lowercased()})
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
            }.sorted(by: {$0.object(forKey: "cityName") as? String ?? "" < $1.object(forKey: "cityName") as? String ?? ""})
        let city = cityArray[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = city.object(forKey: "cityName") as? String
        cell.detailTextLabel?.text = city.object(forKey: "radioStation") as? String
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return states[section]
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let venueDetailVC = storyboard?.instantiateViewController(withIdentifier: "stationDetail") as? StationDetailsTableViewController {
            let state = states[indexPath.section]
            let cityArray = cities.filter { (city) -> Bool in
                return city.object(forKey: "stateName") as? String == state
            }.sorted(by: {$0.object(forKey: "cityName") as? String ?? "" < $1.object(forKey: "cityName") as? String ?? ""})
            let city = cityArray[indexPath.row]
            venueDetailVC.city = city
            navigationController?.pushViewController(venueDetailVC, animated: true)
        }
    }
}


extension RadioContactsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
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
                        if name.substring(to: min(searchText.endIndex, name.endIndex)).lowercased() == searchText.lowercased() {
                            return true
                        }
                    }
                }
                if let stateName = city.object(forKey: "stateName") as? String {
                    let stateNameArray = stateName.components(separatedBy: " ")
                    for name in stateNameArray {
                        if name.substring(to: min(searchText.endIndex, name.endIndex)).lowercased() == searchText.lowercased() {
                            return true
                        }
                    }
                }
                
                if let station = city.object(forKey: "radioStation") as? String {
                    let sstationArray = station.components(separatedBy: " ")
                    for name in sstationArray {
                        if name.substring(to: min(searchText.endIndex, name.endIndex)).lowercased() == searchText.lowercased() {
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
        searchBar.text = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

extension RadioContactsTableViewController: MusicianBookingPlusViewControllerDelegate {
    func musicianBookingViewControllerDidCancel() {
        self.tabBarController?.selectedIndex = 0
    }
    
    func musicianBookingViewControllerDidPurchase() {
        UserDefaults.standard.set(true, forKey: "purchased")
    }
}

















