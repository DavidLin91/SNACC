//
//  LearnMore.swift
//  SNACC
//
//  Created by David Lin on 12/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class LearnMore: UIViewController {
    @IBOutlet weak var learnMore: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        learnMore.isEditable = false
        learnMore.isSelectable = false
    }
    

}
