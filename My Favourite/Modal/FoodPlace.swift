//
//  FoodPlace.swift
//  My Favourite
//
//  Created by Minh Trương on 21/07/2023.
//

import SwiftUI
import CoreLocation

struct FoodPlace: Identifiable, Codable{
    var id: Int
    var name: String
    var address: String
    var imageName: String
    var tags: [String]
    
    var image: Image{
        Image(imageName)
    }
    var content: String
    var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Codable{
    var longitude: Double
    var latitude: Double
}
