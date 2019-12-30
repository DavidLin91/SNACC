//
//  SecondViewController.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var bookmarksButton: UIButton!
    @IBOutlet weak var loyaltyCardsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewWillLayoutSubviews() {
        logoutButton.layer.cornerRadius = 5.0 //rounded corner buttons
        profilePicture.layer.cornerRadius = 10.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicture.image = UIImage(named: "profilepic")
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        
    }
    
    
    
    
    
}

