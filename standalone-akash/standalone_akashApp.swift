//
//  standalone_akashApp.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import SwiftUI

@main
struct Assignment_0221App: App {
    var serverData = ServerData()
    let RESOURCE_NAME = "servers"
    let RESOURCE_TYPE = "json"
    
//    @State var loading = true
    
    var body: some Scene {
        WindowGroup {
            if let directory = Bundle.main.path(forResource: RESOURCE_NAME, ofType: RESOURCE_TYPE) {
                ContentView()
                    .task {
                        serverData.directory = directory
                        print("Directory = \(directory)")
                        do {
                            try await serverData.getServers()
                            print("Got servers")
                        } catch {
                            print("Error loading")
                        }
                    }
                    .environmentObject(serverData)
            } else {
                Text("Failed to find json")
            }
            
//            SearchView()
//                .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}
