//
//  ContentView.swift
//  NearMeAzam
//
//  Created by MD Tanvir Alam on 31/5/21.
//

import SwiftUI
import MapKit

enum DisplayType {
    case map
    case list
}

struct ContentView: View {
    @StateObject private var placeListViewModel = PlaceListViewModel()
    @State private var userTrackingMode : MapUserTrackingMode = .follow
    @State private var searchTerm = ""
    @State private var displayType:DisplayType = .map
    
    private func getRegion()->Binding<MKCoordinateRegion>{
        guard let coordiate = placeListViewModel.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        return .constant(MKCoordinateRegion(center: coordiate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
    
    var body: some View {
        VStack {
            
            TextField("Search", text: $searchTerm, onEditingChanged: { _ in
                
            }, onCommit: {
                // get all landmarks
                placeListViewModel.searchLandMarks(searchTerm: searchTerm)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker("Select", selection: $displayType) {
                Text("Map").tag(DisplayType.map)
                Text("List").tag(DisplayType.list)
            }.pickerStyle(SegmentedPickerStyle())
            
            if displayType == .map{
                Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems:placeListViewModel.landMarks){ landmark in
                    MapMarker(coordinate: landmark.coordinate)
                    
                }
            }else if displayType == .list{
                ListView(landmarks: placeListViewModel.landMarks)
            }
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
