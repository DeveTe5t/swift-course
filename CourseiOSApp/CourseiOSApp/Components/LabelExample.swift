//
//  LabelExample.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 12/06/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("LEARN", image: "swiftui")
        Label("RUNING", systemImage: "figure.run")
        Label(
            title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
            icon: { Image("swiftui")
                .resizable()
                .scaledToFit()
                .frame(height: 50) }
        )
    }
}

#Preview {
    LabelExample()
}
