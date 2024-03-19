//
//  ItemList.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

enum ItemList: Hashable, Codable {
    case play([Server.Player])
    case plug([Server.Plugin])
    case m([Server.Mod])
}
