//
//  OffersBrain.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct AllOffersBrain {
    let restaurantName: String
    let description: String
    let category: String
    let startDate: Int
    let endDate: Int
    let restaurantImage: String
    let restLogo: String

    
    static let allOffers: [AllOffersBrain] = [
        AllOffersBrain(restaurantName: "Chanson", description: "10% OFF ANY PASTRY", category: "Desserts", startDate: 15202019 , endDate: 15292020, restaurantImage: "chansontn", restLogo: "chansonlogo"),
        AllOffersBrain(restaurantName: "ViVi Bubble Tea", description: "FREE Drink Upgrade from Medium to Large", category: "Drinks", startDate: 059059, endDate: 09049864, restaurantImage: "vivitn", restLogo: "vivilogo")
    ]
}

