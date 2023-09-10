//
//  MapScreen.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/10/23.
//

import Foundation
import MapKit
import SwiftUI

struct MapScreen: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.334900,
            longitude: -122.009020
        ),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    let place = [
        IdentifiablePlace(lat: 37.334900, long: -122.009020),
        IdentifiablePlace(lat: 37.33089, long: -122.00746)
    ]
    var body: some View {
        Map(
            coordinateRegion: $region,
            interactionModes: .pan,
            showsUserLocation: true,
            annotationItems: place
        ) { place in
            MapAnnotation(coordinate: place.location) {
                Asset.Images.fushigibana.swiftUIImage
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
    }
}

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}
