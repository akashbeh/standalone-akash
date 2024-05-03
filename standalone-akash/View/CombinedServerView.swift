//
//  CombinedServerView.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//

import SwiftUI

struct CombinedServerView: View {
    @Binding var server: Server
    
    var body: some View {
        ScrollView {
            ServerView(server: $server)
            ServerView2(server: $server)
            ServerView3(server: $server)
        }
    }
}
