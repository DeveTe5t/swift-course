//
//  SuperheroSearcher.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 15/07/24.
//

import SwiftUI

struct SuperheroSearcher: View {
    @State var superheroName: String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    
    var body: some View {
        VStack {
            
            TextField("", text: $superheroName, prompt:
                Text("Superfulan...")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding(16)
            .border(.purple, width: 1.5)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                print(superheroName)
                Task {
                    do {
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                    } catch {
                        print("Error")
                    }
                }
            }
            
            List(wrapper?.results ?? []) { superhero in
                SuperheroItem(superhero: superhero)
            }.listStyle(.plain)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

struct SuperheroItem: View {
    let superhero: ApiNetwork.Superhero
    var body: some View {
        ZStack{
            Rectangle()
            VStack{
                Spacer()
                Text(superhero.name)
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.gray.opacity(0.5))
            }
        }
        .frame(height: 200)
        .cornerRadius(32)
        .listRowBackground(Color.backgroundApp)
    }
}

#Preview {
//    SuperheroSearcher()
    SuperheroItem(superhero: ApiNetwork.Superhero(id: "", name: "sup"))
}
