//
//  Restaurants.swift
//  SNACC
//
//  Created by David Lin on 12/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct Restaurants: Codable {
    let restaurants: [RestaurantData]
}

struct RestaurantData: Codable {
    let name: String
    let location: Location
    let phone: String
    let hours: Hours
    let offers: AllOffers
}

struct Location: Codable {
    let address: String
    let borough: String
    let neighborhood: String
    let long: Double
    let lat: Double
}

struct Hours: Codable {
    let monday: String
    let tuesday: String
    let wednesday: String
    let thursday: String
    let friday: String
    let saturday: String
    let sunday: String
}

struct AllOffers: Codable {
    let offer1: OfferDetails
    let offer2: OfferDetails
}

struct OfferDetails: Codable {
    let offerTitle: String
    let startDate: String
    let endDate: String
    let description: String
    let restriction: String
    
}
