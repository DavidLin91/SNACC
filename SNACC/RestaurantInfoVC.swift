//
//  RestaurantInfoVC.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class RestaurantInfoVC: UIViewController {
    
    var allrestaurant: AllRestaurants?
    @IBOutlet weak var restaurantStockPhoto: UIImageView!
    @IBOutlet weak var loyaltyCardButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loyaltyCardButton.layer.cornerRadius = 10.0
        self.bookmarkButton.layer.cornerRadius = 10.0
        restaurantStockPhoto.image = UIImage(named: allrestaurant?.restaurantStockPhoto ?? "alimama")
    }

}
