//
//  Place.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 17/07/24.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
    var favorite: Bool
}
