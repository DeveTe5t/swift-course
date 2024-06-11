//
//  ContentView.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 10/06/24.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        //ZStack {
            //Rectangle().foregroundColor(.red)
            
            VStack {
                /*Image(systemName: "globe")
                 .imageScale(.large)
                 .foregroundStyle(.tint)
                 Text("Hey, world!")
                 Text("Hey, world!").bold().foregroundStyle(.cyan)*/
                
                /*Text("Fulano")
                VStack {
                    Text("Fulano2")
                    Text("Fulano3")
                        .bold()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                }*/
                
                HStack {
                    Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Rectangle().foregroundColor(.orange)
                    Rectangle().foregroundColor(.yellow)
                }
                
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Circle().foregroundColor(.green)
                    Rectangle()
                    Circle().foregroundColor(.indigo)
                }
                .frame(height: 250)
                
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Rectangle().foregroundColor(.orange)
                    Rectangle().foregroundColor(.yellow)
                }
            }
            .background(.red)
        //}
    }
}

#Preview {
    Exercise1()
}
