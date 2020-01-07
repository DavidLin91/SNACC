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
    @IBOutlet weak var getDirectionsButton: UIBarButtonItem!
    
    
   // let locationManager = CLLocationManager()  // setup location manager reference and initialize
    //let regionInMeters: Double = 10000 // substituting int input since its going to be used a lot
    var previousLocation: CLLocation?
    
    
    
   // let geoCoder = CLGeocoder()
    var directionsArray: [MKDirections] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //locationManager.delegate = self
        //mapView.delegate = self
        //centerViewOnUserLocation()
        //checkLocationServices()
        resturantLocation()
    }
    
    
//    func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//    }
    
    func resturantLocation() {
        let resturantLat = Double((allRestaurants?.location.lat)!)
        let resturantLon = Double((allRestaurants?.location.lon)!)
        
        let resturantLocation = CLLocationCoordinate2D(latitude: resturantLat, longitude: resturantLon)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: resturantLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: resturantLat, longitude: resturantLon)
        annotation.title = allRestaurants?.location.address
        mapView.addAnnotation(annotation)
        
    }
    
//    func centerViewOnUserLocation() {    // zooms in and centers on users location
//        if let location = locationManager.location?.coordinate {
//            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//            mapView.setRegion(region, animated: true)
//        }
//    }
//
//    func checkLocationServices() {  // checking to see if location services are enabled
//        if CLLocationManager.locationServicesEnabled() { // turned on
//            setupLocationManager()  //loads data
//            checkLocationAuthorization() // runs location authorization
//        } else {  //location services turned off
//
//        }
//    }
//
//    func checkLocationAuthorization() {  // setting permission for when the app can access a user's location
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedWhenInUse:  // user authorizes location services when map is in use
//            startTrackingUserLocation()
//        case .denied: // user denies location services when map is in use
//            // if users click deny, you want to show them some notif to show them how to turn it on
//            // if user clicks deny, there is no way to prompt them to turn it back on
//            break
//        case .notDetermined:
//            // ask for permission
//            locationManager.requestWhenInUseAuthorization()
//            break
//        case .restricted: // cannot change status
//            // show user alert to show them its restricted
//            break
//        case .authorizedAlways:
//            break
//        @unknown default:  // do we need this?
//            break
//        }
//    }
    
//    func startTrackingUserLocation() {
//        mapView.showsUserLocation = true
//        centerViewOnUserLocation()  //will zoom in on userlocation based on long and lat value
//        locationManager.startUpdatingLocation()
//        previousLocation = getCenterLocation(for: mapView)
//    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
//    func getDirections() {
//        guard let location = locationManager.location?.coordinate else {
//            //ToDO: Inform user we don't have their current location
//            return
//        }
//
//        let request = createDirectionRequest(from: location)
//        let directions = MKDirections(request: request)
//        resetMapView(withNew: directions)
//
//        directions.calculate { [unowned self] (response, error) in
//            //TODO: handle error if needed
//            guard let response = response else { return } //TODO: Show response nto available in an alert
//            for route in response.routes {
//                self.mapView.addOverlay(route.polyline)
//                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true) // adjusts the map size to see whole route
//            }
//        }
//    }
    
    func createDirectionRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destionationCoordinate = getCenterLocation(for: mapView).coordinate
        let startingLocation = MKPlacemark(coordinate: coordinate)
        let destination = MKPlacemark(coordinate: destionationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile // need a segmented control for other forms of tramsportation
        request.requestsAlternateRoutes = true
        
        return request
    }
    
    func resetMapView(withNew directions: MKDirections) {
        mapView.removeOverlays(mapView.overlays)
        directionsArray.append(directions)
        let _ = directionsArray.map { $0.cancel() }
    }
    
    @IBAction func getDirectonsButtonPressed(_ sender: UIBarButtonItem) {
       // getDirections()
    }
    
}


extension MapScreenVC: CLLocationManagerDelegate { // conforming to delegate
    
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        checkLocationAuthorization() // if user allows location tracking, the location Manager activates and the map will automatically be zoomed in
//    }
//}


//extension MapScreenVC: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//        let center = getCenterLocation(for: mapView)
//        let geoCoder = CLGeocoder()
//        
//        guard let previousLocation = self.previousLocation else { return }
//        
//        guard center.distance(from: previousLocation) > 50 else { return }
//        self.previousLocation = center
//        
//        geoCoder.cancelGeocode()
//        
//        geoCoder.reverseGeocodeLocation(center) {[weak self] (placemarks, error) in
//            guard let self = self else { return }
//            
//            if let _ = error {
//                //TODO: Show alert informing the user
//                return
//            }
//            
//            guard let placemark = placemarks?.first else {
//                //TODO: Show alert informing the user
//                return
//            }
//            
//            let streetNumber = placemark.subThoroughfare ?? ""
//            let streetName = placemark.thoroughfare ?? ""
//            let postalCode = placemark.postalCode ?? ""
//            let region = placemark.subLocality ?? ""
//            
//            print(streetName)
//            
//            DispatchQueue.main.async {
//                self.addressLabel.text = " \(streetNumber) \(streetName), \(region) \(postalCode)"
//            }
//        }
//    }
//    
    func mapView(_ mapVIew: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .systemBlue
        renderer.lineWidth = 5
        
        return renderer
    }
    
    
    
}
