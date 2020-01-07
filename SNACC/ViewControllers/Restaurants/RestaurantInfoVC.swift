//
//  RestaurantInfoVC.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class RestaurantInfoVC: UIViewController {
    
    var allrestaurant: Restaurant?
    
    @IBOutlet weak var restaurantStockPhoto: UIImageView!
    @IBOutlet weak var loyaltyCardButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var offersButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var restaurantNumberLabel: UILabel!
    @IBOutlet weak var mondayHours: UILabel!
    @IBOutlet weak var tuesdayHours: UILabel!
    @IBOutlet weak var wednesdayHours: UILabel!
    @IBOutlet weak var thursdayHours: UILabel!
    @IBOutlet weak var fridayHours: UILabel!
    @IBOutlet weak var saturdayHours: UILabel!
    @IBOutlet weak var sundayHours: UILabel!
    
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
        
        restaurantStockPhoto.image = UIImage(named: allrestaurant?.name.lowercased() ?? "")
        restaurantNameLabel.text = allrestaurant?.name.uppercased()
        
        mondayHours.text =       "\(allrestaurant?.hours.monday ?? "")"
        tuesdayHours.text =      "\(allrestaurant?.hours.tuesday ?? "")"
        wednesdayHours.text =    "\(allrestaurant?.hours.wednesday ?? "")"
        thursdayHours.text =     "\(allrestaurant?.hours.thursday ?? "")"
        fridayHours.text =       "\(allrestaurant?.hours.friday ?? "")"
        saturdayHours.text =     "\(allrestaurant?.hours.saturday ?? "")"
        sundayHours.text =       "\(allrestaurant?.hours.sunday ?? "")"
  
        addressLabel.text = "\(allrestaurant?.location.address ?? "N/A"), \(allrestaurant?.location.borough ?? "")"
        restaurantNumberLabel.text = allrestaurant?.phone
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
