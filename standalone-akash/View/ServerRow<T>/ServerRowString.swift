//
//  ServerRowString.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//

import SwiftUI

struct ServerRowString: View {
    let title: String
    @Binding var bind: String
    
    @State var editing = false
    
//    init() {
//        value = bind ?? ""
//    }
    
    var body: some View {
         HStack {
             Text(title)
                 .fontWeight(.bold)
             Spacer()
             
             if editing {
                 TextField("", text: $bind)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                 
             } else {
                 Text(bind)
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
