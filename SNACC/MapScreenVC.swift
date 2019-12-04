//
//  MapScreenVC.swift
//  SNACC
//
//  Created by David Lin on 12/4/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import MapKit // to show map
import CoreLocation // to show user location

class MapScreenVC: UIViewController {
    
    var allRestaurants: AllRestaurants?
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()  // setup location manager reference and initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
        
        
        func checkLocationServices() {  // checking to see if location services are enabled
            if CLLocationManager.locationServicesEnabled() { // turned on
            setupLocationManager()  //loads data
            checkLocationAuthorization() // runs location authorization
            } else {  //location servicdes turned off
            
        }
    }
    
    func checkLocationAuthorization() {  // setting permission for when the app can access a user's location
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:  // user authorizes location services when map is in use
        break
        case .denied: // user denies location services when map is in use
        // if users click deny, you want to show them some notif to show them how to turn it on
        // if user clicks deny, there is no way to prompt them to turn it back on
        break
        case .notDetermined:
        // ask for permission
        break
        case .restricted: // cannot change status
        // show user alert to show them its restricted
        break
        case .authorizedAlways:
        break
        @unknown default:  // do we need this?
        break
        }
    }
}


extension MapScreenVC: CLLocationManagerDelegate { // conforming to delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    }
    
}
