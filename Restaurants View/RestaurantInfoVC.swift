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
    @IBOutlet weak var storeHoursLabel: UILabel!
    @IBOutlet weak var offersButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var restaurantNumberLabel: UILabel!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loyaltyCardButton.layer.cornerRadius = 5.0
        bookmarkButton.layer.cornerRadius = 5.0
        loyaltyCardButton.layer.cornerRadius = 5.0
        bookmarkButton.layer.cornerRadius = 5.0
        mapButton.layer.cornerRadius = 5.0
        callButton.layer.cornerRadius = 5.0
        offersButton.layer.cornerRadius = 5.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantStockPhoto.image = UIImage(named: allrestaurant?.restaurantStockPhoto ?? "alimama")
        restaurantNameLabel.text = allrestaurant?.restaurantName.uppercased()
        storeHoursLabel.text = allrestaurant!.storeHours
        addressLabel.text = "\(allrestaurant!.address), \(allrestaurant!.borough)"
        restaurantNumberLabel.text = "1-800-RESTAURANT"
        offersButton.setTitle(" OFFERS ", for: .normal)
    }
    
    @IBAction func loyaltyCardButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func mapButtonPressed(_ sender: Any) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "loyaltyCardSegue" {
            guard let loyaltyCardVC = segue.destination as? LoyaltyCardVC else {
                fatalError("")
            }
            loyaltyCardVC.allRestaurants = allrestaurant
        } else if segue.identifier == "mapSegue" {
            guard let mapSegue = segue.destination as? MapScreenVC else {
                fatalError("")
            }
            mapSegue.allRestaurants = allrestaurant
        }
    }
    
    
}
