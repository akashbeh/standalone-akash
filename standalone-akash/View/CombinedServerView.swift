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
            Spacer()
            ServerViewMainInfo(server: $server)
            ServerViewPlayers(server: $server)
            ServerViewSoftware(server: $server)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 0.25)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

// Failed because previews do not accept binding
//struct MyPreviewProvider_Previews: PreviewProvider {
//    @State var server = Server(name: "Test", online: true, ip: "192", port: 89, hostname: "Test")
//    static var previews: some View {
//        CombinedServerView(server: $server)
//    }
//}
