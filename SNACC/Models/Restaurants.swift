//
//  Restaurants.swift
//  SNACC
//
//  Created by David Lin on 12/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct Restaurants: Codable {
    let restaurant1, restaurant2, restaurant3, restaurant4: Restaurant
    let restaurant5, restaurant6, restaurant7: Restaurant
    
    var allRest: [Restaurant] { return
        [restaurant1, restaurant2, restaurant3, restaurant4, restaurant5, restaurant6, restaurant7]
    }
    
}

struct Restaurant: Codable {
    let name, category, subCategory: String
    let location: Location
    let restaurantImages: [RestaurantImage]
    let phone: String
    let hours: Hours
    var offers: [AllOffers]
}


struct Hours: Codable {
    let monday, tuesday, wednesday, thursday: String
    let friday, saturday, sunday: String
}


struct Location: Codable {
    let address, borough, neighborhood: String
    let lat, lon: Double
}


struct AllOffers: Codable {
    let offer1, offer2: OfferClass
}


struct OfferClass: Codable {
    let offerTitle, offerImage, startDate, endDate, offerDescription: String
    let offerRestriction: String
}


struct RestaurantImage: Codable {
    let stock: String
    let logo: String
}
