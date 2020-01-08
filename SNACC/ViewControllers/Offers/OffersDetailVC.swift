//
//  OffersDetailVC.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class OffersDetailVC: UIViewController {

    var offersDetail: Restaurant?
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var offerSubtitle: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var offerDescription: UITextView!
    @IBOutlet weak var claimOfferButton: UIButton!
    @IBOutlet weak var restrictionDescription: UITextView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    
    
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.claimOfferButton.layer.cornerRadius = 5.0
    self.offerDescription.layer.cornerRadius = 5.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantName.text = offersDetail?.name.uppercased()
        offerSubtitle.text = offersDetail?.offers.first?.offerTitle.uppercased()
        restaurantImage.image = UIImage(named: "\(offersDetail?.name.lowercased() ?? "")" )
        offerDescription.text =  offersDetail?.offers.first?.offerDescription
        restrictionDescription.text = offersDetail?.offers.first?.offerRestriction
        startDateLabel.text = "Start Date: \(offersDetail?.offers.first?.startDate ?? "")"
        endDateLabel.text = "End Date: \(offersDetail?.offers.first?.endDate ?? "")"
        
        offerDescription.isEditable = false
        offerDescription.isSelectable = false
        restrictionDescription.isEditable = false
        restrictionDescription.isSelectable = false
    }
    
    
    
    
    
    
    
    
    
    
}
