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
    @Published var landMarks = [LandMarkViewModel]()
    
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
    
    func searchLandMarks(searchTerm:String){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let error = error{
                print(error)
            }else if let response = response{
                let mapItems = response.mapItems
                self.landMarks = mapItems.map {
                    return LandMarkViewModel(placeMark: $0.placemark)
                }
            }
        }
    }
}
