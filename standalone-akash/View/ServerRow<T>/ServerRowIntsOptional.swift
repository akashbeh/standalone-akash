//
//  ServerRowInts.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//
import SwiftUI


struct ServerRowIntsOptional: View {
    let title: String
    @Binding var int1: Int?
    @Binding var int2: Int?
    
    @State var editing = false
    
    @State var text1 = ""
    @State var text2 = ""
    
//    init() {
//        text1 = String(int1)
//        text2 = String(int2)
//    }
    
    var body: some View {
         HStack {
             Text(title)
                 .fontWeight(.bold)
             Spacer()
             
             if editing {
                 TextField("", text: $text1)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .keyboardType(.numberPad)
                 Text("/")
                 TextField("", text: $text2)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .keyboardType(.numberPad)
             } else {
                 Text(text1)
                 Text("/")
                 Text(text2)
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
             .task {
                 if let int1Exists = int1 {
                     text1 = String(int1Exists)
                 }
                 if let int2Exists = int2 {
                     text2 = String(int2Exists)
                 }
//                 if let int1Exists = int1, let str1 = String(int1Exists) {
//                     text1 = str1
//                 }
//                 if let int2Exists = int2, let str2 = String(int2Exists) {
//                     text2 = str2
//                 }
             }
         }
         .padding()
         .onDisappear {
             if let text1Int = Int(text1) {
                 int1 = text1Int
             }
             if let text2Int = Int(text2) {
                 int2 = text2Int
             }
             
         }
     }
}
