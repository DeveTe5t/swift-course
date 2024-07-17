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
            MapReader { proxy in
                
                Map(position: $position) {
//                    Marker("Main cathedral of the archdiocese", coordinate: CLLocationCoordinate2D(latitude: 19.7024184, longitude: -101.1955801))
                    
                    Annotation("Main cathedral of the archdiocese", coordinate: CLLocationCoordinate2D(latitude: 19.7024184, longitude: -101.1955801)) {
                        Circle()
                            .frame(height: 30)
                            .foregroundColor(.blue)
                    }.annotationTitles(.visible)
                }
                .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
    //            location on move and stop show results
    //                .onMapCameraChange { context in
    //                    print("We are in: \(context.region)")
    //                }
    //                location on continue move show results
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("We are in: \(context.region)")
                    }
                    .onTapGesture { coordinate in
                        if let coordinates = proxy.convert(coordinate, from: .local) {
                            withAnimation {
                                position = MapCameraPosition.region(MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                                )
                            }
                        }
                    }
            }
            
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
