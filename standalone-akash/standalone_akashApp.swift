//
//  standalone_akashApp.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import SwiftUI

@main
struct Assignment_0221App: App {
//    @State var serverData = ServerData()
    var body: some Scene {
        WindowGroup {
//            SearchView()
//                .background(Color.black.edgesIgnoringSafeArea(.all))
            ContentView(serverData: nil)
        }
    }
}
