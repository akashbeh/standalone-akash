//
//  ServerView.swift
//  Assignment_0221
//
//  Created by keckuser on 2/21/24.
//

import SwiftUI

struct ServerView: View {
    let server: Server
    let java: Bool
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
        
        ServerRow(title: "Online", value: server.online ? "Yes" : "No")
        
        ServerRow(title: "IP", value: server.ip)
        ServerRow(title: "Port", value: "\(server.port)")
        ServerRow(title: "Hostname", value: server.hostname)
        
    }
}
