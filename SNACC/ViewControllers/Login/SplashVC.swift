//
//  SplashVC.swift
//  SNACC
//
//  Created by David Lin on 12/28/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!

    
    override func viewDidLayoutSubviews() {
        signUpButton.layer.cornerRadius = 5.0
        logInButton.layer.cornerRadius = 5.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

}
