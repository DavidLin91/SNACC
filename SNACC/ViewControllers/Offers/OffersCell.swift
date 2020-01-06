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
        offerImage.image = UIImage(named: "\(restaurant.offers[0].offer1.offerImage.lowercased())")
        restaurantName.text = restaurant.name
        offerDescription.text = restaurant.offers[0].offer1.offerDescription.description
        self.offerImage.layer.cornerRadius = 5.0
    }

}
