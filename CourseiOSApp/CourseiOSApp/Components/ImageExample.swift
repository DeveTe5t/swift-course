//
//  ImageExample.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 11/06/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftui")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 180)
        
        Image(systemName: "figure.walk")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 180)
    }
}

#Preview {
    ImageExample()
}
