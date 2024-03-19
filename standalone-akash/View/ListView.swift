//
//  ItemList.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import SwiftUI

struct ListView: View {
    let iterList: ItemList
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Name")
                    .fontWeight(.bold)
                Spacer()
                Text("Version")
                    .fontWeight(.bold)
            }.padding(.horizontal,10)
            switch iterList {
            case .play(let playerList):
                ForEach(playerList, id: \.self) { player in
                    SmallRow(title: player.name, value: "")
                }
            case .plug(let pluginList):
                ForEach(pluginList, id: \.self) { plugin in
                    SmallRow(title: plugin.name, value: plugin.version)
                }
            case .m(let modList):
                ForEach(modList, id: \.self) { mod in
                    SmallRow(title: mod.name, value: mod.version)
                }
            }
        }
    }
}

