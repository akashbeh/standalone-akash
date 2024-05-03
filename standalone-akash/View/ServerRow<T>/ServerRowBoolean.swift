//
//  ServerRowBoolean.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//

import SwiftUI

struct ServerRowBoolean: View {
    let title: String
    @Binding var bind: Bool
    
    @State var editing = false
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
            Spacer()
            
            if editing {
                Toggle(isOn: $bind) {
                    Text(bind ? "Yes" : "No")
                }
                
            } else {
                Text(bind ? "Yes" : "No")
            }
            Button(action: {
                self.editing.toggle()
            }) {
                if editing {
                    Text("✔️")
                } else {
                    Text("📝")
                }
            }
        }
        .padding()
     }
}
