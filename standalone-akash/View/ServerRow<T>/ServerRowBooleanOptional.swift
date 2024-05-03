//
//  ServerRowBoolean.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//

import SwiftUI

struct ServerRowBooleanOptional: View {
    let title: String
    @Binding var bind: Bool?
    
    @State var value: Bool
    
    @State var editing = false
    
    var body: some View {
        if let bindExists = bind {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                Spacer()
                
                if editing {
                    Toggle(isOn: $value) {
                        Text(bindExists ? "Yes" : "No")
                    }
                    
                } else {
                    Text(bindExists ? "Yes" : "No")
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
            .onDisappear {
                bind = value
            }
        }
     }
}
