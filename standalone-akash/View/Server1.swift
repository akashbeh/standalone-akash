//
//  Server1.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import SwiftUI

struct Server1: View {
    let server: Server
    var body: some View {
        IconView(server: server)
        
        if let motd = server.motd {
            ForEach(motd.clean, id: \.self) { line in
                Text(line)
            }
        }
        
        ServerRow(title: "Online", value: server.online ? "Yes" : "No")
        
        ServerRow(title: "IP", value: server.ip)
        ServerRow(title: "Port", value: "\(server.port)")
        ServerRow(title: "Hostname", value: server.hostname)
        
        if let players = server.players, let onlinePlayers = players.online , let maxPlayers = players.max {
            ServerRow(title: "Online Players", value: "\(onlinePlayers)/\(maxPlayers)")
        }
        
        if let version = server.version {
            ServerRow(title: "Version", value: version)
        }
    }
}
