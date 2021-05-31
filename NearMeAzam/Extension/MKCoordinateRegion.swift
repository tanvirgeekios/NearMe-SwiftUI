//
//  MKCoordinateRegion.swift
//  NearMeAzam
//
//  Created by MD Tanvir Alam on 31/5/21.
//

import Foundation
import MapKit

extension MKCoordinateRegion{
    static var defaultRegion:MKCoordinateRegion{
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.72, longitude: -95.39), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) )
    }
}
