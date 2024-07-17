//
//  MapExample.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 17/07/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.7024184, longitude: -101.1955801),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        )
    
    var body: some View {
        ZStack {
            Map(position: $position)
                .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
            
            VStack {
                Spacer()
                HStack {
                    Button("Go south") {
                        withAnimation {
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 19.6812863, longitude: -101.2134543),
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                            )
                        }
                    }
                    .padding(24)
                    .background(.white)
                    .cornerRadius(5.0)
                    .padding()
                    
                    Button("Go north") {
                        withAnimation {
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 19.7086649, longitude: -101.1716314),
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                            )
                        }
                    }
                    .padding(24)
                    .background(.white)
                    .cornerRadius(5.0)
                    .padding()
                    
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
