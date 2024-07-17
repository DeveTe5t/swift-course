//
//  ApiNetwork.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 16/07/24.
//

import Foundation

class ApiNetwork {
    
    // Codable id for parsing
    struct Wrapper: Codable {
        let response: String
        let results: [Superhero]
    }
    
//    Identifiable is for the list
    struct Superhero: Codable, Identifiable {
        let id: String
        let name: String
        let image: ImageSuperhero
    }
    
    struct ImageSuperhero: Codable {
        let url: String
    }
    
    struct SuperheroCompleted: Codable {
        let id: String
        let name: String
        let image: ImageSuperhero
        let powerstats: Powerstats
        let biography: Biography
    }
    
    struct Powerstats: Codable {
        let intelligence: String
        let strength: String        
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable {
//        original
//        let full-name: String
//        changed because swift not allow var o let with -
        let fullName: String
        let aliases: [String]
        let publisher: String
        let alignment: String
        
        enum CodingKeys: String, CodingKey {
//             this is necesary
            case fullName = "full-name"
//            Not necesary only for error not codable
            case aliases = "aliases"
            case publisher = "publisher"
            case alignment = "alignment"
        }
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper {
        
        let accessToken: String = "c01ef8c3efb8310f7f836c5380f68bf1"
        let urlString: String = "https://superheroapi.com/api/\(accessToken)/search/\(query)"
        
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
    
    func getHeroById(id: String) {
        
    }
}
