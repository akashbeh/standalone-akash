//
//  ContentView.swift
//  standalone-akash
//
//  Created by keckuser on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    let serverData: ServerData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(serverData) { server in
                    Text("\(server.name)")
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}


