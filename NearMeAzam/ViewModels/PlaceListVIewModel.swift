//
//  PlaceListVIewModel.swift
//  NearMeAzam
//
//  Created by MD Tanvir Alam on 31/5/21.
//

import Foundation
import Combine
import MapKit

class PlaceListViewModel:ObservableObject{
    private let locationManager:LocationManager
    var cancellable:AnyCancellable?
    @Published var currentLocation : CLLocationCoordinate2D?
    
    init(){
        locationManager = LocationManager()
        cancellable = locationManager.$location.sink { (location) in
            if let location = location{
                DispatchQueue.main.async {
                    self.currentLocation = location.coordinate
                }
            }
        }
    }
}
