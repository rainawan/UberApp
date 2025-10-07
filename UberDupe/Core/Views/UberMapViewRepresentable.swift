//
//  UberMapViewRepresentable.swift
//  UberDupe
//
//  Created by Raina Wan on 10/2/25.
//

import SwiftUI
import MapKit

// writing SwiftUI's UberMapViewRepresentable
// want to embed Apple's MKMapView
// UIViewRepresentable is the protocol that connects the two
struct UberMapViewRepresentable: UIViewRepresentable {
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    // called when SwiftUI creates MKMapView. makes map view
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false // disable rotation
        mapView.showsUserLocation = true // shows blue dot location
        mapView.userTrackingMode = .follow // map follows user location
        
        return mapView
    }
    
    // call this when the state changes & view needs to update
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    // send events (taps, region changes)
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension UberMapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: UberMapViewRepresentable
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        // can zoom in and view user location
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            // communicate b/w MapCoordinator and Represntable
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
