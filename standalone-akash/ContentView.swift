//
//  ContentView.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var serverData: ServerData
    
    var body: some View {
        TabView {
            ServerListView()
                .tabItem{
                    Label("Servers", systemImage: "house.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .padding()
    }
}

// Preview did not work here
//struct MyPreviewProvider_Previews: PreviewProvider {
//    @State var server = Server(name: "Test", online: true, ip: "192", port: 89, hostname: "Test")
//    @State var serverClass = ServerData()
//    serverClass.servers = [server]
//    static var previews: some View {
//        ContentView().environmentObject(serverData)
//    }
//}
