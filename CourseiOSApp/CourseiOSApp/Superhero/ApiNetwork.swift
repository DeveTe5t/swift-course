//
//  ApiNetwork.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 16/07/24.
//

import Foundation

class ApiNetwork {
    
    // For parsing is Codable
    struct Wrapper: Codable {
        let response: String
        let results: [Superhero]
    }
    
    struct Superhero: Codable, Identifiable {
        let id: String
        let name: String
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper {
        
        let accessToken: String = "c01ef8c3efb8310f7f836c5380f68bf1"
        let urlString: String = "https://superheroapi.com/api/\(accessToken)/search/\(query)"
        
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
}
