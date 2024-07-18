//
//  MenuView.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 25/06/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        // Must return a view
        NavigationStack {
//            VStack(content: {
            List{
//                // Way 1
//                NavigationLink {
//                    BMIView()
//                } label: {
//                    Text("BMI Calculator")
//                }
                
                // Way 2
                NavigationLink(destination:BMIView()){
                    // BMI (Body Mass Index)
                    Text("BMI calculator")
                }
                NavigationLink(destination: SuperheroSearcher()) {
                    Text("Superhero finder")
                }
                NavigationLink(destination: FavPlaces()) {
                    Text("Favorites places")
                }                
            }
        }
    }
}

#Preview {
    MenuView()
}
