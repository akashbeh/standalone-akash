//
//  Player.swift
//  Assignment_0221
//
//  Created by keckuser on 2/19/24.
//
//
import Foundation
// import Network - use for IPAddress if you want

struct Server: Codable, Hashable {
    var name: String?
    
    var online: Bool
    var ip: String
    var port: Int
    var hostname: String

    var version: String?
    var icon: String?
    var software: String?
    
    var map: Map?
    struct Map: Hashable, Codable {
        var raw: String
        var clean: String
        var html: String
    }
    
    var gamemode: String? // bedrock only
    var serverid: String? // bedrock only
    var eula_blocked: Bool? // java only
    
    var players: Players?
    struct Players: Hashable, Codable {
        var online: Int?
        var max: Int?
        var list: [Player]?
    }
    struct Player: Hashable, Codable {
        var name: String
        var uuid: String
    }
    
    var plugins: [Plugin]?
    struct Plugin: Hashable, Codable {
        var name: String
        var version: String
        
    }
    
    var mods: [Mod]?
    struct Mod: Hashable, Codable {
        var name: String
        var version: String
        
    }
    
    var motd: Info?
    struct Info: Hashable, Codable {
        
        var raw: [String]
        var clean: [String]
        var html: [String]
    }
    
    var info: Info?
    
    
    func java() -> Bool {
        if eula_blocked != nil {
            return true
        }
        return false
    }

    func getName() -> String {
        if let nameExists = name {
            return nameExists
        } else {
            return hostname
        }
    }
}
