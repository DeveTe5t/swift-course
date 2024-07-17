//
//  SuperheroDetail.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 16/07/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id: String
    
    @State var superhero: ApiNetwork.SuperheroCompleted? = nil
    @State var loading: Bool = true
    
    var body: some View {
        VStack {
            if loading {
                ProgressView().tint(.white)
            }
//            if superhero is not nil
            else if let superhero = superhero {
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
//                    .scaledToFit()
                    .scaledToFill()
                    .frame(height: 450)
                    .clipped()
                
                Text(superhero.name)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                
//                ForEach(superhero.biography.aliases, id: \.self) { alias in
                ForEach(superhero.biography.aliases.indices.prefix(2), id: \.self) { index in
                                                            
                    let alias = superhero.biography.aliases[index]
                    Text(alias)
                        .foregroundColor(.gray)
                        .italic()
                    
                }
                
//                Text(superhero.biography.fullName)
//                    .foregroundColor(.white)
                
                Text(superhero.biography.publisher)
                    .foregroundColor(.white)
                
                Text(superhero.biography.alignment)
                    .bold()
                    .font(.title3)
                    .foregroundColor(.white)
                
                SuperheroStats(stats: superhero.powerstats)
                
                Spacer()
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundApp)
        .onAppear {
            Task {
                do {
                    superhero = try await ApiNetwork().getHeroById(id: id)
                } catch {
                    superhero = nil
                }
                
                loading = false
            }
        }
    }
}

struct SuperheroStats: View {
    let stats: ApiNetwork.Powerstats
    
    var body: some View {
        VStack {
            
            Chart {
                SectorMark(
                    angle: .value("Count", Int(stats.combat) ?? 0),
                    innerRadius: .ratio(0.6), // width of sectormark
                    angularInset: 5 // separation between sectormark
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Combat"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.durability) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Durability"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.intelligence) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Inteligence"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.power) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Power"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.speed) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Speed"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.strength) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Stregth"))
            }
        }
        .padding(16)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 350)
        .background(.white)
        .cornerRadius(16)
        .padding(24)
    }
}

#Preview {
    SuperheroDetail(id: "70")
}
