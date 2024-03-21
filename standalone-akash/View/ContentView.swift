//
//  ContentView.swift
//  standalone-akash
//
//  Created by keckuser on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @State var serverData: [Server]?
    
    var body: some View {
        NavigationView {
            if let servers = serverData {
                List {
                    ForEach(servers, id: \.self) { server in
                        Text("\(server.hostname)")
                    }
                }
                .navigationTitle("Menu")
                .listStyle(GroupedListStyle())
            }
        }.task {
            do {
                serverData = try await getServers(addr: "arim.json", jav: true)
            } catch {
                print("Error")
            }
        }
    }
    
    
}


