//
//  Place.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 17/07/24.
//

import Foundation
import MapKit

struct Place: Identifiable, Codable {
    var id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
    var favorite: Bool
    
    enum CodingKeys: CodingKey {
        case id, name, coordinates, favorite, latitude, longitude
    }
    
    init(id: UUID = UUID(), name: String, coordinates: CLLocationCoordinate2D, favorite: Bool) {
        self.id = id
        self.name = name
        self.coordinates = coordinates
        self.favorite = favorite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        favorite = try container.decode(Bool.self, forKey: .favorite)
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(favorite, forKey: .favorite)
        try container.encode(coordinates.latitude, forKey: .latitude)
        try container.encode(coordinates.longitude, forKey: .longitude)
    }
}
