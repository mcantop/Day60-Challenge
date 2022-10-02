//
//  NetworkService.swift
//  Day60Challenge
//
//  Created by Maciej on 02/10/2022.
//

import Foundation

class NetworkSerivce {
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { fatalError("Wrong URL.") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetchig data.") }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let decoded = try decoder.decode([User].self, from: data)
        
        return decoded
    }
}
