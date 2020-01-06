//
//  RestaurantVC.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

enum SearchScope {
    case name
    case description
}

class RestaurantVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var restaurants = [Restaurant]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var currentScope = SearchScope.name
//    var searchQuery = "" {
//        didSet{
//            switch currentScope {
//            case .name:
//                restaurants = [Restaurant].filter {
//                    $0.restaurantName.lowercased().contains(searchQuery.lowercased())   }
//            case .description:
//                restaurants = AllRestaurants.allRestaurants.filter {
//                    $0.description.lowercased().contains(searchQuery.lowercased())   }
//            }
//        }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //searchBar.delegate = self
        loadData()
        tableView.backgroundColor = UIColor.white
    }
    
    func loadData() {
        RestaurantsAPIClient.getRestaurants { (result) in
            switch result {
            case .failure:
                break
            case .success(let data):
                self.restaurants = data.allRest
            }
        }
    }
    
//    func filterHeadlines(for searchText: String) {  // (property observer) did set gets called
//        guard !searchText.isEmpty else { return } // guarding against an empty search query
//        restaurants = AllRestaurants.allRestaurants.filter { $0.restaurantName.lowercased().contains(searchText.lowercased())  }
//    }
    
    
    
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

//extension RestaurantVC: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard !searchText.isEmpty else{
//            loadData()
//            return
//        }
//        searchQuery = searchText
//    }
//}
