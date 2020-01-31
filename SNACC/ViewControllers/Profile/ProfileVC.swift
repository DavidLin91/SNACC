//
//  SecondViewController.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import Firebase

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
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            presentSplashVC()
        }catch{
            print("Error while signing out!")
        }
        
    }
    
}

extension UIViewController {
    func presentSplashVC() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "splashVC") as! SplashVC
        
        // is this fix correct?
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
}

