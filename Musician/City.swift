//
//  City.swift
//  Musician
//
//  Created by John Detjen on 6/14/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit

class City: NSObject {
    
    var cityName = ""
    var noOfVenues = 0
    var state = ""
    
    init(name: String, venues: Int, state: String) {
        self.cityName = name
        self.noOfVenues = venues
        self.state = state
    }

}
