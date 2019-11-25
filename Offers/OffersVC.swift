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
    
    var allOffer = [AllOffersBrain]() {
        didSet {
            offersTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offersTableView.backgroundColor = UIColor.white
        offersTableView.dataSource = self

        loadData()
    }
    
    func loadData() {
        allOffer = AllOffersBrain.allOffers
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let offersVC = segue.destination as? OffersDetailVC,
            let indexPath = offersTableView.indexPathForSelectedRow else {
                fatalError()
        }
        
        let offer = allOffer[indexPath.row]
        offersVC.offersDetail = offer
    }
    
    
    
    
}
extension OffersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOffer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "offersCell", for: indexPath)
        let offer = allOffer[indexPath.row]
        cell.textLabel?.text = offer.restaurantName
        cell.detailTextLabel?.text = offer.description.uppercased()
        cell.imageView?.image = UIImage(named: offer.restaurantImage)
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.textColor = UIColor.lightGray
        return cell
    }
}
