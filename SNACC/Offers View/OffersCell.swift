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
    
    func configureCell (offer: AllOffersBrain) {
        offerImage.image = UIImage(named: offer.restaurantImage)
        restaurantName.text = offer.restaurantName
        offerDescription.text = offer.description
    }

}
