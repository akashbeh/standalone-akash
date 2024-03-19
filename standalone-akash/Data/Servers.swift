//
//  Servers.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import Foundation

let DIRECTORY = "Users/keckuser/Documents/asb/cmsi2022/a1/standalone-akash/standalone-akash/Data/"

enum APIError: Error {
    case notFound
    case decodingError
    case unexpectedError
}

func getServer(address: String, java: Bool) async throws -> Server {
    
    let url = NSURL.fileURL(withPath: "\(DIRECTORY)arim.json") // For testing on computer 1
    print(url)
    
    let data = (try await URLSession.shared.data(from: url)).0 // CHANGE
    print(data)
    
// "~/Documents/asb/mob_app_2/Assignment_0221/output.json"
    if let decodedServer = try? JSONDecoder().decode(Server.self, from: data) {
        return decodedServer
    } else {
        print("Decoding error")
        throw APIError.decodingError
    }
}
