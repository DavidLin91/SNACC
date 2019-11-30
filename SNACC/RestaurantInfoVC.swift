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
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantInfoTV: UITableView!
    
    
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    loyaltyCardButton.layer.cornerRadius = 10.0
    bookmarkButton.layer.cornerRadius = 10.0
    loyaltyCardButton.layer.cornerRadius = 10.0
    bookmarkButton.layer.cornerRadius = 10.0
    restaurantInfoTV.backgroundColor = UIColor.white
    }
    

    override func viewDidLoad() {
    super.viewDidLoad()
    restaurantStockPhoto.image = UIImage(named: allrestaurant?.restaurantStockPhoto ?? "alimama")
    restaurantNameLabel.text = allrestaurant?.restaurantName.uppercased()
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loyaltyCardVC = segue.destination as? LoyaltyCardVC else {
            fatalError("")
        }
        loyaltyCardVC.allRestaurants = allrestaurant

    }
    
    
    
}
