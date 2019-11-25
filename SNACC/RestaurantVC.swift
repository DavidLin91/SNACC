//
//  RestaurantVC.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class RestaurantVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var restaurants = [AllRestaurants]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        tableView.backgroundColor = UIColor.white
    }
    
    func loadData() {
        restaurants = AllRestaurants.allRestaurants
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let restaurantDVC = segue.destination as? RestaurantInfoVC,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("")
        }
        let restaurant = restaurants[indexPath.row]
        restaurantDVC.allrestaurant = restaurant
        
    }
    
    
}
extension RestaurantVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as? RestaurantCell else {
            fatalError("Could not retrieve restaurantCell")
        }
        let restaurant = restaurants[indexPath.row]
        cell.configureCell(for: restaurant)
        return cell
    }
}
extension RestaurantVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
