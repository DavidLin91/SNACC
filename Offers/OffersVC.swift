//
//  OffersVC.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class OffersVC: UIViewController {
    @IBOutlet weak var offersTableView: UITableView!
    
    var allOffers = [AllOffersBrain]() {
        didSet {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offersTableView.backgroundColor = UIColor.white
        offersTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        allOffers = AllOffersBrain.allOffers
    }
    
}
extension OffersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOffers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "offersCell", for: indexPath)
        let offer = allOffers[indexPath.row]
        cell.textLabel?.text = offer.restaurantName
        cell.detailTextLabel?.text = offer.description
        cell.imageView?.image = UIImage(named: offer.restaurantImage)
        return cell
    }
}
