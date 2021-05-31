//
//  ContentView.swift
//  NearMeAzam
//
//  Created by MD Tanvir Alam on 31/5/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var placeListViewModel = PlaceListViewModel()
    @State private var userTrackingMode : MapUserTrackingMode = .follow
    
    private func getRegion()->Binding<MKCoordinateRegion>{
        guard let coordiate = placeListViewModel.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        return .constant(MKCoordinateRegion(center: coordiate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
    
    var body: some View {
        Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: $userTrackingMode)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
