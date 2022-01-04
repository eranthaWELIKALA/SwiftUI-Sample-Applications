//
//  School.swift
//  SriLankanSchoolDetailsApp
//
//  Created by Erantha Welikala on 1/3/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct School: Hashable, Codable {
    
    var imageName: String
    var name: String
    var district: String
    var description: String
    var isFavorite: Bool
    
    var image: Image {
        Image(imageName)
    }
    
    private var location: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
