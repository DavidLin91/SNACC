//
//  OffersDetailVC.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class OffersDetailVC: UIViewController {

    var offersDetail: AllOffersBrain?
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var offerSubtitle: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var offerDescription: UITextView!
    @IBOutlet weak var claimOfferButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantName.text = "RESTAURANT NAME"
        self.claimOfferButton.layer.cornerRadius = 10.0
        self.offerDescription.layer.cornerRadius = 10.0
    }
    

}
