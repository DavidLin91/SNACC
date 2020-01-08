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

    @IBAction func callButtonPressed(_ sender: UIButton) {
        allrestaurant?.phone.makeACall()

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


// extension used to make phone calls
extension String {

    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }

    func isValid(regex: RegularExpressions) -> Bool { return isValid(regex: regex.rawValue) }
    func isValid(regex: String) -> Bool { return range(of: regex, options: .regularExpression) != nil }

    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }

    func makeACall() {
        guard   isValid(regex: .phone),
                let url = URL(string: "tel://\(self.onlyDigits())"),
                UIApplication.shared.canOpenURL(url) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
