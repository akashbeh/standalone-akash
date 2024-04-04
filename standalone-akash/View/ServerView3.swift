//
//  ServerView2.swift
//  Assignment_0221
//
//  Created by keckuser on 4/3/24.
//

import SwiftUI

struct ServerView3: View {
    let server: Server
    let java: Bool
    @State var showPlayers = false
    @State var showPlugins = false
    @State var showMods = false
    
    var body: some View {
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
                VStack {
                    HStack {
                        Text("Name")
                            .fontWeight(.bold)
                        Spacer()
                        Text("Version")
                            .fontWeight(.bold)
                    }.padding(.horizontal,10)
                    ForEach(plugins, id: \.self) { plugin in
                        SmallRow(title: plugin.name, value: plugin.version)
                    }
                }
            }
        }
        
        Spacer()
        
        if let mods = server.mods {
            Toggle("Show mods",isOn: $showMods)
            
            if showMods {
                VStack {
                    
                        HStack {
                            Text("Name")
                                .fontWeight(.bold)
                            Spacer()
                            Text("Version")
                                .fontWeight(.bold)
                        }.padding(.horizontal,10)
                    ForEach(mods, id: \.self) { mod in
                            SmallRow(title: mod.name, value: mod.version)
                    }
                }
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
