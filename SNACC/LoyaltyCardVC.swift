//
//  LoyaltyCardVC.swift
//  SNACC
//
//  Created by David Lin on 11/24/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class LoyaltyCardVC: UIViewController {
    
    var allRestaurants: AllRestaurants?
    
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var loyaltyCardButtons: UIButton!
    @IBOutlet weak var claimButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.learnMoreButton.layer.cornerRadius = 10.0
        self.claimButton.layer.cornerRadius = 10.0
        restaurantName.text = allRestaurants?.restaurantName.uppercased()
        companyLogo.image = UIImage(named: allRestaurants!.restLogo)
        
    }
}
