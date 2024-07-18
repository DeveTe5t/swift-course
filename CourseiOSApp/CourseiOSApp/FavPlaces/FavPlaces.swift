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
//            center: CLLocationCoordinate2D(latitude: 40.419969, longitude: -3.702561),
            center: CLLocationCoordinate2D(latitude: 19.7024071, longitude: -101.1922935),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
    
    @State var places: [Place] = []
    
//    @State var showPopUp: Bool = false
    @State var showPopUp: CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var favorite: Bool = false
    @FocusState private var isFocused: Bool
    @State var showSheet: Bool = false
    
    let heightSheet = stride(from: 0.3, through: 0.3, by: 0.1)
        .map { PresentationDetent.fraction($0) }
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            
                            let color = if place.favorite { Color.yellow } else { Color.black }
                            
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35, alignment: .center)
                        }
                    }
                }
                .onTapGesture { coordinate in
                    if let coordinates = proxy.convert(coordinate, from: .local) {
                        showPopUp = coordinates
                    }
                }
                .overlay {
                    VStack {
                        Button("Show list") {
                            showSheet = true
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                        .padding(16)
                        
                        Spacer()
                    }
                }
            }
            
            if showPopUp != nil {
                
                let view = VStack {
                    Text("Add location").font(.title2).bold()
                    TextField("Name", text: $name)
                        .padding(.top, 32)
                        .padding(.bottom, 16)
                        .focused($isFocused)
                        .onAppear {
                            isFocused = true
                        }
                    Toggle("Is a favorite place?", isOn: $favorite)
                    Spacer()
                    
                    if name != "" {
                        Button("Save") {
                            savePlace(name: name, coordinates: showPopUp!, favorite: favorite)
                            clearForm()
                        }
                        .padding(.bottom, 10)
                    }
                }
                
                withAnimation {
                    CustomDialog(closeDialog: {
                        showPopUp = nil
                    }, onDismissOutside: true, content: view)
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            Text("Saved places")
                .font(.title)
                .bold()
                .padding(.top, 16)
            
            ScrollView(.horizontal) {
                
                LazyHStack {
                    
                    ForEach(places) { place in
                        let color = if place.favorite { Color(.yellow) } else { Color(.black).opacity(0.9) }
                        
                        VStack {
                            Text(place.name)
                                .font(.title3)
//                                .bold()
                        }
                        .frame(width: 150, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(color, lineWidth: 1)
                        }
                        .shadow(radius: 5)
                        .padding(.horizontal, 8)
                        .onTapGesture {
//                            withAnimation {
//                                position = MapCameraPosition.region(MKCoordinateRegion(
//                                    center: place.coordinates,
//                                    span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
//                                )
//                            }
                            animateCamera(coordinates: place.coordinates)
                            showSheet = false
                        }
                    }
                }
            }.presentationDetents(Set(heightSheet))
        }.onAppear {
            loadPlaces()
        }
    }
    
    func savePlace(name: String, coordinates: CLLocationCoordinate2D, favorite: Bool) {
        let place = Place(name: name, coordinates: coordinates, favorite: favorite)
        places.append(place)
        savePlaces()
    }
    
    func clearForm() {
        name = ""
        favorite = false
        showPopUp = nil
    }
    
    func animateCamera(coordinates: CLLocationCoordinate2D) {
        withAnimation {
            position = MapCameraPosition.region(MKCoordinateRegion(
                center: coordinates,
//                span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
                span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
            )
        }
    }
}

#Preview {
    FavPlaces()
}

// with extension conect to FavPlaces and should have the same name
extension FavPlaces {
    
    func savePlaces() {
        
        if let encodeData = try? JSONEncoder().encode(places) {
            UserDefaults.standard.set(encodeData, forKey: "places")
        }
    }
    
    func loadPlaces() {
        
        if let savedPlaces = UserDefaults.standard.data(forKey: "places"),
           let decodedPlaces = try? JSONDecoder().decode([Place].self, from: savedPlaces) {

            places = decodedPlaces
        }
    }
}
