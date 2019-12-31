//
//  LoginVC.swift
//  SNACC
//
//  Created by David Lin on 12/28/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
    }
    
    
    @IBAction func logInButtonPressed(_ sender: Any) {
    }
    

}
