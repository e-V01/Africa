//
//  MapView.swift
//  Africa
//
//  Created by Y K on 24.01.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    var body: some View {
//        Map(coordinateRegion: $region)
        
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // Old style: pin stylec (always static)
//            MapPin(coordinate: item.location, tint: .accent)
            // New style: Mark style (always static)
//            MapMarker(coordinate: item.location, tint: .accent)
            // Custom style: Custom style (may be interactive)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }

        })
    }
}

#Preview {
    MapView()
}
