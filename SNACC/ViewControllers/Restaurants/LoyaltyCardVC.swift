//
//  LoyaltyCardVC.swift
//  SNACC
//
//  Created by David Lin on 11/24/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class LoyaltyCardVC: UIViewController {
    
    var allRestaurants: Restaurant?
    
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var claimButton: UIButton!
    
    
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    learnMoreButton.layer.cornerRadius = 5.0
    claimButton.layer.cornerRadius = 5.0
    companyLogo.layer.cornerRadius = 5.0
    buttonOne.layer.cornerRadius = 5.0
    buttonTwo.layer.cornerRadius = 5.0
    buttonThree.layer.cornerRadius = 5.0
    buttonFour.layer.cornerRadius = 5.0
    buttonFive.layer.cornerRadius = 5.0
    buttonSix.layer.cornerRadius = 5.0
    buttonSeven.layer.cornerRadius = 5.0
    buttonEight.layer.cornerRadius = 5.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantName.text = allRestaurants?.name.uppercased()
        companyLogo.image = UIImage(named: "\(allRestaurants?.name.lowercased() ?? "")logo")
        
    }
    
    @IBOutlet var LoyaltyButtons: [UIButton]!
}
