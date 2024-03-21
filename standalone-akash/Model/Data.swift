//
//  Data.swift
//  standalone-akash
//
//  Created by keckuser on 3/20/24.
//

import Foundation

//public class ServerData {
//    var servers: [Server] = getServer(address: "arim.json", java: true)
    
//}

func getServers(addr: String, jav: Bool) async throws -> [Server] {
    
    let url = NSURL.fileURL(withPath: "\(DIRECTORY)\(addr)") // For testing on computer 1
    print(url)
    
    let data = (try await URLSession.shared.data(from: url)).0 // CHANGE
    print(data)
    
// "~/Documents/asb/mob_app_2/Assignment_0221/output.json"
    if let decodedServers = try? JSONDecoder().decode([Server].self, from: data) {
        return decodedServers
    } else {
        print("Decoding error")
        throw APIError.decodingError
    }
}


func load<T: Decodable>(_ filename: String) -> T { // from Brian Bowers
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldnt load \(filename) from main bundle: \n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Couldnt parse \(filename) as \(T.self):\n\(error)")
    }
}
