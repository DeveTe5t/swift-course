//
//  ListExample.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 14/07/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmilion"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Fulanachu")
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Graymon"),
    Digimon(name: "Supermon"),
    Digimon(name: "Spidermon"),
    Digimon(name: "Fulanmon"),
    Digimon(name: "Fulanmon"),
]

struct ListExample: View {
    var body: some View {
//        Basic way
//        List{
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
        
//        List{
//            ForEach(pokemons, id: \.name) { pokemon in
//                /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
//            }
//        }
//        
//        List(digimons) { digimon in
//            Text(digimon.name)
//        }
        
//        List {
//            ForEach(digimons) { digimon in
//                Text(digimon.name)
//            }
//        }
        
        List {
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id: \.name) { pokemon in
                    /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
                }
            }
            Section(header: Text("Digimons")) {
                ForEach(digimons) { digimon in
                    Text(digimon.name)
                }
            }
        }
        .listStyle(.automatic)
    }
}

struct Pokemon {
    let name: String
}

struct Digimon: Identifiable {
    var id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
