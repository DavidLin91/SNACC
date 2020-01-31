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
    var allRestaurants: Restaurant?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var openMapsButton: UIBarButtonItem!
    
    let regionInMeters: Double = 10000 // substituting int input since its going to be used a lot
    var previousLocation: CLLocation?
    var directionsArray: [MKDirections] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantLocation()
        addressLabel.text = "\(allRestaurants?.location.address ?? ""), \(allRestaurants?.location.borough ?? "")"
    }
    

    func restaurantLocation() {
        let resturantLat = Double((allRestaurants?.location.lat)!)
        let resturantLon = Double((allRestaurants?.location.lon)!)
        
        
        let restaurantLocation = CLLocationCoordinate2D(latitude: resturantLat, longitude: resturantLon)
        let region = MKCoordinateRegion(center: restaurantLocation.self, latitudinalMeters: CLLocationDistance(exactly: 3000)!, longitudinalMeters: CLLocationDistance(exactly: 3000)!)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: resturantLat, longitude: resturantLon)
        annotation.title = allRestaurants?.name
        mapView.addAnnotation(annotation)
    }
    
    
    
    
    func checkLocationAuthorization() {  // setting permission for when the app can access a user's location
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:  // user authorizes location services when map is in use
            break
        //         startTrackingUserLocation()
        case .denied: // user denies location services when map is in use
            // if users click deny, you want to show them some notif to show them how to turn it on
            // if user clicks deny, there is no way to prompt them to turn it back on
            break
        case .notDetermined:
            // ask for permission
            //         locationManager.requestWhenInUseAuthorization()
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
    
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    
    
    
    
    @IBAction func openMapsButtonClicked(_ sender: UIBarButtonItem) {
        openMapForPlace()
    }
    
    func openMapForPlace() {

        let lat1 : NSString = self.allRestaurants?.location.lat.description as! NSString
        let lng1 : NSString = self.allRestaurants?.location.lon.description as! NSString

        let latitude:CLLocationDegrees =  lat1.doubleValue
        let longitude:CLLocationDegrees =  lng1.doubleValue

        let regionDistance:CLLocationDistance = 3000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(self.allRestaurants?.name ?? "")"
        mapItem.openInMaps(launchOptions: options)
    }
    
}


extension MapScreenVC: CLLocationManagerDelegate { // conforming to delegate
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization() // if user allows location tracking, the location Manager activates and the map will automatically be zoomed in
    }
}






