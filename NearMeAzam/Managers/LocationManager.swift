//
//  LocationManager.swift
//  NearMeAzam
//
//  Created by MD Tanvir Alam on 31/5/21.
//

import Foundation
import MapKit

class LocationManager:NSObject, ObservableObject, CLLocationManagerDelegate{
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{return}
        DispatchQueue.main.async {
            self.location = location
        }
    }
}
