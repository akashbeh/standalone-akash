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
