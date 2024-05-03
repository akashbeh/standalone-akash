//
//  ServerView2.swift
//  Assignment_0221
//
//  Created by keckuser on 4/3/24.
//

import SwiftUI

struct ServerViewPlayers: View {
    @Binding var server: Server // let
    @State var showPlayers = false
    
    @State var serverPlayers = Server.Players(online: nil, max: nil, list: nil)
    @State var serverMap = Server.Map(raw: "", clean: "", html: "")
    
    var body: some View {
        VStack {
            if let players = server.players, let onlinePlayers = players.online , let maxPlayers = players.max {
                ServerRowIntsOptional(title: "Online Players", int1: $serverPlayers.online, int2: $serverPlayers.max)
                    .task {
                        serverPlayers = players
                    }
            }
            
            if let version = server.version {
                ServerRowStringOptional(title: "Version", bind: $server.version, value: version)
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
                ServerRowString(title: "Map", bind: $serverMap.clean)
                    .task {
                        serverMap = map
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.green.opacity(0.3))
    }
}
