//
//  SuperheroSearcher.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 15/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcher: View {
    @State var superheroName: String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false
    
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
                loading = true
                
                print(superheroName)
                Task {
                    do {
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                    } catch {
                        print("Error")
                    }
                    
                    loading = false
                }
            }
            
            if (loading) {
                ProgressView().tint(.white)
            }
            
            NavigationStack {
                List(wrapper?.results ?? []) { superhero in
//                    Remove arrow of navigation link
                    ZStack{
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: SuperheroDetail(id: superhero.id)) {
                            EmptyView()
                        }.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            
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
//            With native code
//            image original height 640
//            AsyncImage(url: URL(string: superhero.image.url)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(height: 480)
//            }
//            placeholder: {
//                ProgressView()
//            }
            
//            With package
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 480)
            
            VStack{
                Spacer()
                Text(superhero.name)
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.gray.opacity(0.5)
                )
            }
        }
        .frame(height: 480)
        .cornerRadius(32)
    }
}

#Preview {
    SuperheroSearcher()
//    SuperheroItem(superhero: ApiNetwork.Superhero(
//        id: "",
//        name: "Supergirl",
//        image: ApiNetwork.ImageSuperhero.init(url: "https://www.superherodb.com/pictures2/portraits/10/100/790.jpg")
//    ))
}
