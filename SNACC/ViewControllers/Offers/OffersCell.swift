//
//  OffersCell.swift
//  SNACC
//
//  Created by David Lin on 12/24/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class OffersCell: UITableViewCell {
    
    @IBOutlet weak var offerImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var offerDescription: UILabel!
    
    func configureCell (restaurant: Restaurant) {
        // guard against empty..
        offerImage.image = UIImage(named: "\(restaurant.offers.first!.offerImage.lowercased())")
        restaurantName.text = restaurant.name
        offerDescription.text = restaurant.offers.first?.offerDescription
        self.offerImage.layer.cornerRadius = 5.0
    }

}
