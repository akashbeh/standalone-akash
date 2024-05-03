//
//  ServerRowInt.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//

import SwiftUI

struct ServerRowInt: View {
    let title: String
    @Binding var bind: Int
    
    @State var text = ""
    
    @State var editing = false
    
    var body: some View {
         HStack {
             Text(title)
                 .fontWeight(.bold)
             Spacer()
             
             if editing {
                 TextField("", text: $text)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .keyboardType(.numberPad)
                     .onSubmit {
                         if let integer = Int(text) {
                             bind = integer
                         }
                     }
                 
             } else {
                 Text(text)
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
