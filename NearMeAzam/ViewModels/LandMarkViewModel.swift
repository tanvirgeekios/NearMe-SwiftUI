//
//  LandMarkViewModel.swift
//  NearMeAzam
//
//  Created by MD Tanvir Alam on 1/6/21.
//

import Foundation
import MapKit

struct LandMarkViewModel:Identifiable {
    var id = UUID()
    let placeMark:MKPlacemark
    
    var name:String{
        placeMark.name ?? ""
    }
    
    var title:String{
        placeMark.title ?? ""
    }
    
    var coordinate:CLLocationCoordinate2D{
        placeMark.coordinate
    }
}
