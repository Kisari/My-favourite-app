//
//  MapView.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import MapKit
import SwiftUI

struct Address: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var locationCoordinates: CLLocationCoordinate2D
    var locationName: String
    @State private var region: MKCoordinateRegion
    @State private var annnotations: [Address]

    init(locationCoordinates: CLLocationCoordinate2D, locationName: String) {
        self.locationCoordinates = locationCoordinates
        self.locationName = locationName
        _region = State(initialValue: MKCoordinateRegion(
            center: locationCoordinates,
            span: MKCoordinateSpan(latitudeDelta: Constant.Style.locationScale, longitudeDelta: Constant.Style.locationScale)
        ))
        _annnotations = State(initialValue: [
            Address(name: locationName, coordinate: locationCoordinates),
        ])
    }

    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: $annnotations) { _ in
            MapMarker(coordinate: locationCoordinates)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locationCoordinates: CLLocationCoordinate2D(latitude: 20.865139, longitude: 106.683830), locationName: "testing")
    }
}
