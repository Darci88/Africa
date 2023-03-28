//
//  LocationModel.swift
//  Africa
//
//  Created by user219285 on 3/28/23.
//

import Foundation
import MapKit

struct NationalParkLocation: Identifiable, Codable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
