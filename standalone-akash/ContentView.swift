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
//            FavoritesView()
//                .tabItem {
//                    Label("Favorites", systemImage: "star.fill")
//                }
        }
        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 20)
//                .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                .shadow(radius: 0.25)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//        )
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
