//
//  MapScreenViewController.swift
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
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManager = CLLocationManager()  // setup location manager reference and initialize
    let regionInMeters: Double = 10000 // substituting int input since its going to be used a lot
    
    var previousLocation: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        locationManager.delegate = self
        mapView.delegate = self
        }
    
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func centerViewOnUserLocation() {    // zooms in and centers on users location
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {  // checking to see if location services are enabled
        if CLLocationManager.locationServicesEnabled() { // turned on
            setupLocationManager()  //loads data
            checkLocationAuthorization() // runs location authorization
        } else {  //location services turned off
            
        }
    }
    
    func checkLocationAuthorization() {  // setting permission for when the app can access a user's location
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:  // user authorizes location services when map is in use
            startTrackingUserLocation()
        case .denied: // user denies location services when map is in use
            // if users click deny, you want to show them some notif to show them how to turn it on
            // if user clicks deny, there is no way to prompt them to turn it back on
            break
        case .notDetermined:
            // ask for permission
            locationManager.requestWhenInUseAuthorization()
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
    
    func startTrackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()  //will zoom in on userlocation based on long and lat value
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
}


extension MapScreenVC: CLLocationManagerDelegate { // conforming to delegate
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization() // if user allows location tracking, the location Manager activates and the map will automatically be zoomed in
    }
}


extension MapScreenVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) {[weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let _ = error {
                //TODO: Show alert informing the user
                return
            }
            
            guard let placemark = placemarks?.first else {
                //TODO: Show alert informing the user
                return
            }
            
            let streetNumber = placemark.subThoroughfare ?? ""
            let streetName = placemark.thoroughfare ?? ""
            let postalCode = placemark.postalCode ?? ""
            let region = placemark.subLocality ?? ""
            
            print(streetName)
            
            DispatchQueue.main.async {
                self.addressLabel.text = " \(streetNumber) \(streetName), \(region) \(postalCode)"
            }
        }
    }
}
