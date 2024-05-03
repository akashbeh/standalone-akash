//
//  ServerRow.swift
//  standalone-akash
//
//  Created by keckuser on 3/18/24.
//

import Foundation
import SwiftUI

struct ServerRowStringOptional: View {
    let title: String
    @Binding var bind: String?
    @State var value: String
    
    @State var editing = false
    
    var body: some View {
         HStack {
             Text(title)
                 .fontWeight(.bold)
             Spacer()
             
             if editing {
                 TextField("", text: $value)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                 
             } else {
                 Text(value)
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
