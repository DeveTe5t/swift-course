//
//  SuperheroDetail.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 16/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

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
                    .frame(height: 300)
                    .clipped()
                
                Text(superhero.name)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                
                ForEach(superhero.biography.aliases, id: \.self) { alias in
                    Text(alias)
                        .foregroundColor(.gray)
                        .italic()
                }
                
                Text(superhero.biography.fullName)
                    .foregroundColor(.white)
                
                Text(superhero.biography.publisher)
                    .foregroundColor(.white)
                
                Text(superhero.biography.alignment)
                    .foregroundColor(.white)
                
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

#Preview {
    SuperheroDetail(id: "10")
}
