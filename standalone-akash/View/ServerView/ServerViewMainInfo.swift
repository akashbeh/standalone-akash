//
//  ServerView.swift
//  Assignment_0221
//
//  Created by keckuser on 2/21/24.
//

import SwiftUI

struct ServerViewMainInfo: View {
    @Binding var server: Server
    
//    @State var editingName = false
    @State var name = ""
    
    var body: some View {
        VStack {
            
            TextField("Name server...",text: $name)
                .onSubmit {
                    server.name = name
                }
                .font(Font.custom("SpecialElite-Regular", size: 25))
                .font(.largeTitle)
                .foregroundColor(Color(red: 55/255, green: 26/255, blue: 77/255))
            
                .multilineTextAlignment(.center)
                .padding()
                .task {
                    name = server.name ?? ""
                }
//            if let serverName = server.name {
//                if editingName {
//                    TextField("",text: $name)
//                        .onSubmit {
//                            server.name = name
//                        }
//                } else {
//                    Text(serverName)
//                        .font(Font.custom("SpecialElite-Regular", size: 50))
//                        .font(.largeTitle)
//                        .offset(y: -100)
//                        .foregroundColor(Color(red: 55/255, green: 26/255, blue: 77/255))
//                }
//                Spacer().task {
//                    name = serverName
//                }
//
//                Button(action: {
//                    editingName.toggle()
//                }) {
//                    if editingName {
//                        Text("Done✔️")
//                    } else {
//                        Text("Edit📝")
//                    }
//                }
//            } else {
//                Button(action: {
//                    editingName.toggle()
//                }) {
//                    if editingName {
//                        Text("Done✔️")
//                    } else {
//                        Text("Name server...")
//                    }
//                }
//            }
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.green.opacity(0.3))
    }
}
