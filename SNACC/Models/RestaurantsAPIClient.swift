//
//  RestaurantsAPIClient.swift
//  SNACC
//
//  Created by David Lin on 12/31/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct RestaurantsAPIClient {
    static func getRestaurants(completion: @escaping(Result< Restaurants, AppError>) -> ()) {
        
        let endpointURL = "https://snacc-71a6a.firebaseio.com/.json"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                print("error")
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                // debugging (helps check json data)
               // let printData = String(data: data, encoding: .utf8)
                do{
                    let restaurantData = try JSONDecoder().decode(Restaurants.self, from: data)
                    completion(.success(restaurantData))
                } catch {
                    print(error)
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
