//
//  ButtonExample.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 23/06/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hey") {
            print("What")
        }
        Button(action: {print("Whats")}, label: {
            Text("Hey")
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(12.0)
        })
    }
}

struct Counter: View {
    @State var subscribersNumber = 0
    var body: some View {
        Button(action: {
            subscribersNumber += 1
        }, label: {
            Text("Subscribers: \(subscribersNumber)")
                .frame(height: 50)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(12.0)
        })
    }
}

#Preview {
    ButtonExample()
}

#Preview {
    Counter()
}
