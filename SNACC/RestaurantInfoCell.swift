//
//  RestaurantInfoCell.swift
//  SNACC
//
//  Created by David Lin on 11/29/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class RestaurantInfoCell: UITableViewCell {
    
    var allRestaurantInfoCell: AllRestaurants?
    
    @IBOutlet weak var restaurantAdressLabel: UILabel!
    @IBOutlet weak var restaurantStoreHoursLabel: UITextField!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantAdressLabel.text = allRestaurantInfoCell?.address
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
