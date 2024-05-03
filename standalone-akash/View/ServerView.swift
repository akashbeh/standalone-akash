//
//  ServerView.swift
//  Assignment_0221
//
//  Created by keckuser on 2/21/24.
//

import SwiftUI

struct ServerView: View {
    @Binding var server: Server
    @State var showPlayers = false
    @State var showPlugins = false
    @State var showMods = false
    
    var body: some View {
        IconView(server: server)
        
        if let motd = server.motd {
            ForEach(motd.clean, id: \.self) { line in
                Text(line)
            }
        }
        Spacer()
        if let info = server.info {
            Text("Server info")
                .fontWeight(.bold)
            ForEach(info.clean, id: \.self) { line in
                Text(line)
            }
        }
        
        ServerRowBoolean(title: "Online", bind: $server.online)
        
        ServerRowString(title: "IP", bind: $server.ip)
        ServerRowInt(title: "Port", bind: $server.port)
        ServerRowString(title: "Hostname", bind: $server.hostname)
        
    }
}
