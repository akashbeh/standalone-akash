//
//  ContentView.swift
//  standalone-akash
//
//  Created by keckuser on 3/20/24.
//

import SwiftUI

struct ServerListView: View {
    @EnvironmentObject var serverData: ServerData
    
    var body: some View {
        NavigationView {
            if serverData.servers.isEmpty {
                Text("No servers")
            } else {
                List {
                    ForEach(0...(serverData.servers.count-1), id: \.self) { number in
//                        Text(server.hostname)
                        NavigationLink(
                            serverData.servers[number].getName()
                        ) {
                            CombinedServerView(server: $serverData.servers[number])
                        }
                    }
                }
                .navigationTitle("Servers")
                .listStyle(GroupedListStyle())
                .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        
    }
}

