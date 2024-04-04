//
//  Servers.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import Foundation

let DIRECTORY = "Users/keckuser/Documents/asb/cmsi2022/a1/standalone-akash/standalone-akash/Data/"


enum APIError: Error {
    case notURL
    case notFound
    case decodingError
    case unexpectedError
}

func getServer(address: String, java: Bool) async throws -> Server {
    
    guard let url = URL(string: "\(DIRECTORY)\(address)") else {
        throw APIError.notURL
    }
    print(url)
    
    guard let data = try? await URLSession.shared.data(from: url) else { throw APIError.notFound }
    // print(data)
    
// "~/Documents/asb/mob_app_2/Assignment_0221/output.json"
    if let decodedServer = try? JSONDecoder().decode(Server.self, from: data.0) {
        return decodedServer
    } else {
        print("Decoding error")
        throw APIError.decodingError
    }
}
