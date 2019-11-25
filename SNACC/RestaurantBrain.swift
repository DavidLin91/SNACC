//
//  RestaurantBrain.swift
//  SNACC
//
//  Created by David Lin on 11/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct AllRestaurants {
    let restaurantName: String
    let restaurantStockPhoto: String
    let category: String
    let subcategory: String
    let restaurantImage: String
    let borough: String
    let neighborhood: String
    let address: String
    let description: String
    let restLogo: String
    
    
    static let allRestaurants: [AllRestaurants] = [
AllRestaurants(restaurantName: "Chanson", restaurantStockPhoto: "chanson", category: "Desserts", subcategory: "Drinks", restaurantImage: "chansontn", borough: "Manhattan", neighborhood: "Flatiron", address: "20 W 23rd St", description: "Nested in New York City’s Flatiron District, Patisserie Chanson is a modern European café and eatery that specializes in the art of dessert making. With an open display array of innovative gourmet pastries and piquant coffee brews, Chanson is a delight to the senses serving breakfast, brunch, and lunch menus. We are committed to serving freshly prepared Michelin standard French viennoiserie and extensive drink menu. Embrace Patisserie Chanson’s combination of classic European coffee shop and French bakery ambience with a wide selection of breakfast and brunch options. Our reinvented baked goods, aromatic blooming teas, and beautifully blended coffee stimulates even the most discerning palates.", restLogo: "chansonlogo"),
AllRestaurants(restaurantName: "Soft Swerve", restaurantStockPhoto: "softswerve", category: "Ice Cream", subcategory: "", restaurantImage: "softswervetn", borough: "Manhattan", neighborhood: "LES", address: "85B Allen St", description: "Soft Swerve has revolutionized the way people think about soft serve ice cream", restLogo: "softswervelogo"),
AllRestaurants(restaurantName: "Alimama", restaurantStockPhoto: "alimama", category: "Desserts", subcategory: "Donuts", restaurantImage: "alimamatn", borough: "Manhattan", neighborhood: "Chinatown", address: "89A Bayard St", description: "Welcome to Alimama Tea, where we blend the flavors of yesterday with today's best natural ingredients, guided by clean minds, calm hearts, and compassionate spirits. From our mochi desserts to our cold brew teas, we handcraft all of our products with passion and purpose, to nourish your health with zero compromises on taste. Whether you are looking for something to cultivate your vegan sensibilities, sustain a gluten-free diet, or soothe that sweet tooth, you will find it here.", restLogo: "alimamalogo"),
AllRestaurants(restaurantName: "Milk & Cream Cereal Bar", restaurantStockPhoto: "milkandcream", category: "Ice Cream", subcategory: "", restaurantImage: "milkandcreamtn", borough: "Manhattan", neighborhood: "Chinatown", address: "159 Mott St", description: "Milk & Cream Cereal Bar is a modern spin on a timeless favorite. A place where the old reconnects with the new and we strive to bring back your fondest memories and to help create new ones. We serve nostalgia in every bite with an endless combination of your favorite cereals!", restLogo: "milkandcreamlogo"),
AllRestaurants(restaurantName: "Snowdays", restaurantStockPhoto: "snowdays", category: "Desserts", subcategory: "Ice Cream", restaurantImage: "snowdays", borough: "Manhattan", neighborhood: "East Village", address: "241 E 10th St", description: "Snowdays specializes in Shaved Cream desserts, but we also have a wide range of other offerings like, Coffee and Espresso from Intelligentsia, a unique Hot Chocolate menu and Baked goods like our famous Matcha Brownies.", restLogo: "snowdayslogo"),
AllRestaurants(restaurantName: "ViVi Bubble Tea", restaurantStockPhoto: "vivi", category: "Drinks", subcategory: "Bubble Tea", restaurantImage: "vivitn", borough: "Manhattan", neighborhood: "Chinatown", address: "49 Bayard St", description: "Starting from 2007, VIVI BUBBLE TEA, with its cutting-edge technology for tea production, launched the Taiwanese bubble tea business in America. ", restLogo: "vivilogo")
    ]
}
