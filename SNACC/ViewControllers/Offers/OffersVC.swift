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
    
    var allOffers = [Restaurant]() {
        didSet {
            DispatchQueue.main.async {
                self.offersTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offersTableView.backgroundColor = UIColor.white
        offersTableView.dataSource = self
        offersTableView.delegate = self
        loadData()
    }
    
    func loadData() {
        RestaurantsAPIClient.getRestaurants { (result) in
            switch result {
            case .failure:
                break
            case .success(let data):
                self.allOffers = data.allRest
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let offersVC = segue.destination as? OffersDetailVC,
            let indexPath = offersTableView.indexPathForSelectedRow else {
                fatalError()
        }
        
        let offer = allOffers[indexPath.row]
        offersVC.offersDetail = offer
    }
    
    
}
extension OffersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOffers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "offersCell", for: indexPath) as? OffersCell else {
            fatalError()
        }
        let offer = allOffers[indexPath.row]
        cell.configureCell(restaurant: offer)
        return cell
    }
}

extension OffersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
