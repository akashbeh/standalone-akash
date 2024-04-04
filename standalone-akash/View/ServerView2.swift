//
//  ServerView2.swift
//  Assignment_0221
//
//  Created by keckuser on 4/3/24.
//

import SwiftUI

struct ServerView2: View {
    let server: Server
    let java: Bool
    @State var showPlayers = false
    @State var showPlugins = false
    @State var showMods = false
    
    var body: some View {
        if let players = server.players, let onlinePlayers = players.online , let maxPlayers = players.max {
            ServerRow(title: "Online Players", value: "\(onlinePlayers) / \(maxPlayers)")
        }
        
        if let version = server.version {
            ServerRow(title: "Version", value: version)
        }
        
        if let players = server.players, let playerList = players.list {
            Toggle("Show players",isOn: $showPlayers)
            
            if showPlayers {
                VStack {
                    
                    HStack {
                        Text("Name")
                            .fontWeight(.bold)
                        Spacer()
                        Text("Version")
                            .fontWeight(.bold)
                    }.padding(.horizontal,10)
                    ForEach(playerList, id: \.self) { player in
                        SmallRow(title: player.name, value: "")
                    }
                }
            }
        }
        
        if let map = server.map {
            ServerRow(title: "Map", value: map.clean)
        }
    }
}
