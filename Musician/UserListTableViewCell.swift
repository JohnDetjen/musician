//
//  UserListTableViewCell.swift
//  Musician
//
//  Created by John Detjen on 10/16/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import Parse
import MapKit

class UserListTableViewCell: UITableViewCell {


    @IBOutlet weak var bandImage: UIImageView!
    @IBOutlet weak var bandNameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var spotifyButton: UIButton!
    @IBOutlet weak var rowNumber: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var delegate: UserListTableViewCellDelegate?
    var user: PFUser?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // TODO - connect this to the button on storyboard
    @IBAction func spotifyButtonPressed(_ sender: UIButton) {
        delegate?.userListTableViewCell(cell: self, didPressSpotifyButton: sender)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol UserListTableViewCellDelegate {
    func userListTableViewCell(cell: UserListTableViewCell, didPressSpotifyButton: UIButton)
}
