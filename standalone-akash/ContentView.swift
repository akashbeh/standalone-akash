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
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}
