//
//  RestaurantCell.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantCategory: UILabel!
    @IBOutlet weak var restaurantLocation: UILabel!
    
    
    func configureCell( for restaurant: Restaurant) {
        //restaurantImage.image = UIImage(named: restaurant.restaurantImage)
        restaurantName.text = restaurant.name.uppercased()
        restaurantCategory.text = "\(restaurant.category)  \(restaurant.subCategory)"
        restaurantLocation.text = "\(restaurant.location.borough), \(restaurant.location.neighborhood)"
        restaurantLocation.textColor = UIColor.gray
        self.restaurantImage.layer.cornerRadius = 5.0
    }
}
