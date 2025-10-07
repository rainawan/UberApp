//
//  LocationManager.swift
//  UberDupe
//
//  Created by Raina Wan on 10/2/25.
//

import CoreLocation

// class that manages user's location
// ObservableObject: class to hold an object's data/state
class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    // request permission, grab location one time, MapView handles next
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return } // code
        locationManager.stopUpdatingLocation()
    }
}
