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
                Text(superhero.name)                
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

#Preview {
    SuperheroSearcher()
}
