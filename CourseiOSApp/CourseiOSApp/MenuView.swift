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
            VStack(content: {
//                // Way 1
//                NavigationLink {
//                    BMIView()
//                } label: {
//                    Text("BMI Calculator")
//                }
                
                // Way 2
                NavigationLink(destination:BMIView()){
                    // BMI (Body Mass Index)
                    Text("BMI Calculator")
                }
                
                Text("App 2")
                Text("App 3")
                Text("App 4")
                Text("App 5")
            })
        }
    }
}

#Preview {
    MenuView()
}
