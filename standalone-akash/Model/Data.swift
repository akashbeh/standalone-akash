//
//  Data.swift
//  standalone-akash
//
//  Created by keckuser on 3/20/24.
//

import Foundation

public class ServerData {
    var servers: [Server] = load("servers.json")
    
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
