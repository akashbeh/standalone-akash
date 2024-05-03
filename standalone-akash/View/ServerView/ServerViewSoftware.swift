//
//  ServerView2.swift
//  Assignment_0221
//
//  Created by keckuser on 4/3/24.
//

import SwiftUI

struct ServerViewSoftware: View {
    @Binding var server: Server
    @State var showPlugins = false
    @State var showMods = false
    
    var body: some View {
        VStack {
            if !server.java() {
                if let gamemode = server.gamemode {
                    ServerRowStringOptional(title: "Gamemode", bind: $server.gamemode, value: gamemode)
                }
            }
            
            if let software = server.software {
                ServerRowStringOptional(title: "Software", bind: $server.software, value: software)
            }
            
            if let plugins = server.plugins {
                VStack {
                    Toggle("Show plugins",isOn: $showPlugins)
                    
                    
                    if showPlugins {
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
                .padding()
            }
            
            Spacer()
            
            if let mods = server.mods {
                
                VStack {
                    Toggle("Show mods",isOn: $showMods)
                    
                    if showMods {
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
                .padding()
            }
            
            if server.java() {
                if let eulaBlocked = server.eula_blocked {
                    ServerRowBooleanOptional(title: "EULA Blocked", bind: $server.eula_blocked, value: eulaBlocked)
                }
                
            } else {
                if let serverid = server.serverid {
                    ServerRowStringOptional(title: "Server ID", bind: $server.serverid, value: serverid)
                }
            }
            
            Spacer()
            Spacer()
            Text("")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.green.opacity(0.3))
    }
}


