//
//  ServerView.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import SwiftUI
import WebKit
struct ServerView: View {
    let server: Server
    let java: Bool
    @State var showPlayers = false
    @State var showPlugins = false
    @State var showMods = false
    
    var body: some View {
        
        Server1(server: server) // Response to: "The compiler is unable to type-check this expression in reasonable time"
        
        if let players = server.players, let playerList = players.list {
            Toggle("Show players",isOn: $showPlayers)
            
            if showPlayers {
                ListView(iterList: ItemList.play(playerList))
            }
        }
        
        
        // CUT AND PASTE BELOW
        if !java {
            if let gamemode = server.gamemode {
                ServerRow(title: "Gamemode", value: gamemode)
            }
        }
        
        if let software = server.software {
            ServerRow(title: "Software", value: software)
        }
        
        if let plugins = server.plugins {
            Toggle("Show plugins",isOn: $showPlugins)
            
            if showPlugins {
                ListView(iterList: ItemList.plug(plugins))
            }
        }
        
        Spacer()
        
        if let mods = server.mods {
            Toggle("Show mods",isOn: $showMods)
            
            if showMods {
                ListView(iterList: ItemList.m(mods))
            }
        }
        
        if java {
            if let eulaBlocked = server.eula_blocked {
                ServerRow(title: "EULA Blocked", value: eulaBlocked ? "Yes" : "No")
            }
            
        } else {
            if let serverid = server.serverid {
                ServerRow(title: "Server ID", value: serverid)
            }
        }
        
        Spacer()
    }
}
