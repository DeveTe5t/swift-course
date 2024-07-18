//
//  FavPlaces.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 17/07/24.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.419969, longitude: -3.702561),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
    
    @State var places: [Place] = []
    
    @State var showPopUp: Bool = false
    
    @State var name: String = ""
    @State var favorite: Bool = false
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position)
                    .onTapGesture {
                        showPopUp = true
                    }
            }
            
            if showPopUp {
                
                let view = VStack {
                    Text("Add location").font(.title2).bold()
                    Spacer()
                    TextField("Name", text: $name)
                    Toggle("Is a favorite place?", isOn: $favorite)
                    Spacer()
                    Button("Save") {
                        
                    }
                }
                
                withAnimation {
                    CustomDialog(closeDialog: {
                        showPopUp = false
                    }, onDismissOutside: false, content: view)
                }
            }
        }
    }
    
    func savePlace() {
//        let place = Place(name: <#T##String#>, coordinates: <#T##CLLocationCoordinate2D#>, favorite: <#T##Bool#>)
//        places.append(place)
    }
}

#Preview {
    FavPlaces()
}
