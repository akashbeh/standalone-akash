//
//  Data.swift
//  standalone-akash
//
//  Created by keckuser on 3/20/24.
//

import Foundation

class ServerData: ObservableObject {
    @Published var servers: [Server]
    @Published var error: AppError?
    
    var directory: String?
    
    init() {
        servers = [Server]()
    }
    
//    func setServers(serversArg: [Server]) {
//        self.servers = serversArg
//    }
    
    func getServers() async throws {
        if let directoryExists = directory {
            let url = NSURL.fileURL(withPath: "\(directoryExists)")
            print(url)
            
            let data = (try await URLSession.shared.data(from: url)).0
            print(data)
            
            if let decodedServers = try? JSONDecoder().decode([Server].self, from: data) {
//                print("Successful decoding: \(decodedServers.test)")
                self.servers = decodedServers
                // "Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates."
                // This appears as an error, but not publishing servers causes ContentView not to update.
            } else {
                print("Decoding error")
                throw AppError.decodingError
            }
        } else {
            throw AppError.noDirectoryError
        }
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
