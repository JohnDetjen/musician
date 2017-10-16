//
//  ManageTourTableViewCell.swift
//  Musician
//
//  Created by John Detjen on 10/7/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit

class ManageTourTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookingStatus: UIImageView!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var venueLocation: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
